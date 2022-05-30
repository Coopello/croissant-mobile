package com.coopelife.croissant.android.ui.util.extension

import androidx.annotation.DimenRes
import androidx.compose.runtime.Composable
import androidx.compose.runtime.ReadOnlyComposable
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp

@Composable
@ReadOnlyComposable
fun fontDimensionResource(@DimenRes id: Int): TextUnit = dimensionResource(id = id).value.sp
