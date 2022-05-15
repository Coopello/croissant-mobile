package com.coopelife.croissant.android.ui.screen.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class HomeScreenViewModel : ViewModel() {
    private val _screenName = MutableLiveData("HomeScreen")
    val screenName: LiveData<String> = _screenName

    fun onButtonClicked() {
        _screenName.value = "Clicked!"
    }
}
