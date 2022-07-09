package com.coopelife.croissant.android.util

import java.text.SimpleDateFormat
import java.util.Date

internal fun Date.toStringWithSimpleDateFormat(): String =
    SimpleDateFormat(
        HOME_SCREEN_DATE_LIST_FORMAT,
        java.util.Locale.getDefault()
    ).format(this)

private const val HOME_SCREEN_DATE_LIST_FORMAT = "MM/dd"
