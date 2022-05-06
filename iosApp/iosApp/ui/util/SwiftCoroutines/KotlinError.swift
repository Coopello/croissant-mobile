//
// Created by Kohei Inoue on 2022/04/30.
// Copyright (c) 2022 orgName. All rights reserved.
//

import Foundation
import shared

class KotlinError: LocalizedError {
    let throwable: KotlinThrowable
    init(_ throwable: KotlinThrowable) {
        self.throwable = throwable
    }
    var errorDescription: String? {
        get { throwable.message }
    }
}