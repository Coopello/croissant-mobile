//
// Created by Kohei Inoue on 2022/04/23.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Combine
import Foundation
import shared

typealias OnEach<Output> = (Output) -> Void
typealias OnCompletion<Failure> = (Failure?) -> Void

typealias OnCollect<Output, Failure> = (@escaping OnEach<Output>, @escaping OnCompletion<Failure>) -> shared.Closeable

func observe<Output, Failure>(_ onCollect: @escaping OnCollect<Output, Failure>) -> Publishers.KotlinNativePublisher<Output, Failure> {
    Publishers.KotlinNativePublisher(onCollect: onCollect)
}

typealias OnCollect1<T1, Output, Failure> = (T1, @escaping OnEach<Output>, @escaping OnCompletion<Failure>) -> shared.Closeable

func observe<T1, Output, Failure>(_ onCollect: @escaping OnCollect1<T1, Output, Failure>, with arg1: T1) -> Publishers.KotlinNativePublisher<Output, Failure> {
    Publishers.KotlinNativePublisher { onCollect(arg1, $0, $1) }
}

class KotlinNativeSubscription: Subscription {
    private var isCancelled: Bool = false

    var cancellable: shared.Closeable? {
        didSet {
            if isCancelled {
                cancellable?.cancel()
            }
        }
    }

    func request(_ demand: Subscribers.Demand) {
        // Not supported
    }

    func cancel() {
        isCancelled = true
        cancellable?.cancel()
    }
}

extension Publishers {
    class KotlinNativePublisher<Output, Failure: Error>: Publisher {
        private let onCollect: OnCollect<Output, Failure>

        init(onCollect: @escaping OnCollect<Output, Failure>) {
            self.onCollect = onCollect
        }

        func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            let subscription = KotlinNativeSubscription()
            subscriber.receive(subscription: subscription)

            let cancellable = onCollect({ input in _ = subscriber.receive(input) }) { failure in
                if let failure = failure {
                    subscriber.receive(completion: .failure(failure))
                } else {
                    subscriber.receive(completion: .finished)
                }
            }

            subscription.cancellable = cancellable
        }
    }
}
