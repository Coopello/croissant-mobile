package com.coopelife.croissant.data.repository.fake

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.data.repository.PlanRepository
import kotlinx.datetime.Clock

class FakePlanRepository : PlanRepository {
    private val currentUnixTime: Long = Clock.System.now().toEpochMilliseconds() / 1000
    private val aHourSeconds = 3600
    private val threeDaysSeconds = 259200

    override suspend fun fetchRecentPlans(): List<Plan> = listOf(
        Plan(
            id = 1,
            shopName = "焼肉 JIN TOKYO",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + aHourSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1319/A131901/13114121/"
        ),
        Plan(
            id = 2,
            shopName = "魚いち",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
        Plan(
            id = 3,
            shopName = "SITA",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.NOT_ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
        Plan(
            id = 4,
            shopName = "まんてん",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
        Plan(
            id = 5,
            shopName = "おにやんま",
            maxNumberOfPeople = 999,
            minNumberOfPeople = 999,
            proposerId = 3,
            participantIds = listOf(3, 4),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.NOT_ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
    )

    override suspend fun fetchMyPlans(): List<Plan> = listOf(
        Plan(
            id = 1,
            shopName = "焼肉 JIN TOKYO",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4),
            meetingTime = currentUnixTime + aHourSeconds,
            status = Plan.PlanStatus.NOT_ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1319/A131901/13114121/"
        ),
        Plan(
            id = 2,
            shopName = "魚いち",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.NOT_ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
        Plan(
            id = 3,
            shopName = "焼肉 JIN TOKYO22",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + aHourSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1319/A131901/13114121/"
        ),
        Plan(
            id = 4,
            shopName = "魚いち22",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
        Plan(
            id = 5,
            shopName = "焼肉 JIN TOKYO",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + aHourSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1319/A131901/13114121/"
        ),
        Plan(
            id = 6,
            shopName = "魚いち",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.ESTABLISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        ),
        Plan(
            id = 7,
            shopName = "焼肉 JIN TOKYO22",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + aHourSeconds,
            status = Plan.PlanStatus.FINISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1319/A131901/13114121/"
        ),
        Plan(
            id = 8,
            shopName = "魚いち22",
            maxNumberOfPeople = 6,
            minNumberOfPeople = 3,
            proposerId = 3,
            participantIds = listOf(3, 4, 5),
            meetingTime = currentUnixTime + threeDaysSeconds,
            status = Plan.PlanStatus.FINISHED,
            meetingPlace = "https://tabelog.com/tokyo/A1317/A131701/13112185/"
        )
    )
}
