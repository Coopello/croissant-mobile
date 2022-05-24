package com.coopelife.croissant.ui.screen.mypage

import com.coopelife.croissant.data.entitiy.Plan

sealed class MyPageScreenEvent {
    class UpdatePlans(val newPlans: List<Plan>) : MyPageScreenEvent()
    object DoNothing : MyPageScreenEvent()
}
