package com.coopelife.croissant.ui.screen.mypage

import com.coopelife.croissant.data.entitiy.Plan

sealed class MyPageScreenEvent {
    class OnInit(val newPlans: List<Plan>) : MyPageScreenEvent()
    class OnUpdate(val newPlans: List<Plan>) : MyPageScreenEvent()
    object OnUnFormedTabSelected : MyPageScreenEvent()
    object OnFormedTabSelected : MyPageScreenEvent()
    object OnHistoryTabSelected : MyPageScreenEvent()
    object DoNothing : MyPageScreenEvent()
}
