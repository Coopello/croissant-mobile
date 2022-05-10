package com.coopelife.croissant.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.annotation.StringRes
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Face
import androidx.compose.material.icons.filled.Home
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.res.stringResource
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            App()
        }
    }
}

sealed class Screen(val route: String, @StringRes val resourceId: Int, val icon: ImageVector) {
    object Home : Screen("home", R.string.home_title, Icons.Filled.Home)
    object Mypage : Screen("mypage", R.string.mypage_title, Icons.Filled.Face)
}

@Composable
fun App() {
    val navController = rememberNavController()
    val screenItems = listOf(
        Screen.Home,
        Screen.Mypage,
    )
    Scaffold(
        bottomBar = {
            BottomNavigation {
                val navBackStackEntry by navController.currentBackStackEntryAsState()
                val currentRoute = navBackStackEntry?.destination?.route
                screenItems.forEach { screen ->
                    BottomNavigationItem(
                        icon = {
                            Icon(
                                imageVector = screen.icon,
                                contentDescription = screen.route
                            )
                        }, label = { Text(stringResource(id = screen.resourceId)) },
                        selected = currentRoute == screen.route, onClick = {
                            navController.navigate(screen.route) {
                                navController.graph.startDestinationRoute?.let {
                                    popUpTo(it) {
                                        saveState = true
                                    }
                                }
                                launchSingleTop = true
                                restoreState = true
                            }
                        }
                    )
                }
            }
        }
    ) {
        NavHost(navController, startDestination = "home") {
            composable("home") { Home(navController = navController) }
            composable("mypage") { Mypage(navController = navController) }
        }
    }
}

@Composable
fun Home(navController: NavController) {
    Text(text = "home")
}

@Composable
fun Mypage(navController: NavController) {
    Text(text = "mypage")
}
