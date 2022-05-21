package com.coopelife.croissant.data.entitiy

class Plan(
    val id: Int,
    val shopName: String,
    val maxNumberOfPeople: Int,
    val minNumberOfPeople: Int,
    val proposerId: Int,
    val participantIds: List<Int>,
    val meetingTime: Long,
    val status: PlanStatus,
    val meetingPlace: String
) {
    enum class PlanStatus(val code: Int) {
        NOT_ESTABLISHED(0), ESTABLISHED(1), FINISHED(2)
    }
}
