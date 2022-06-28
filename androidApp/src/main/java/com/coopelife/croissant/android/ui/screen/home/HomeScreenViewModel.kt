package com.coopelife.croissant.android.ui.screen.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

internal class HomeScreenViewModel : ViewModel() {
    private val _previewText = MutableLiveData<String>("HomeScreen")
    val previewText: LiveData<String> = _previewText

    fun onButtonClicked() {
        _previewText.value = "Clicked!"
    }
}
