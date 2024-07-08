package com.appmilla.kmpnavigationdemo

import androidx.compose.material.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.navigation.compose.rememberNavController
import navigation.AndroidRouter
import navigation.AndroidScreen
import navigation.ProvideNavController
import navigation.Router
import org.koin.androidx.compose.KoinAndroidContext
import org.koin.compose.koinInject
import org.koin.core.parameter.parametersOf
import screens.HomeScreen
import screens.NewsScreen

@Composable
fun App() {
    // Set current Koin instance to Compose context
    KoinAndroidContext() {
        val navController = rememberNavController()
        // Inject AndroidRouter with NavHostController parameter
        val router: Router = koinInject(parameters = { parametersOf(navController) })

        ProvideNavController(navController) {
            MaterialTheme {
                router.registerRoute("/screens/home", AndroidScreen { HomeScreen() })
                router.registerRoute("/screens/news", AndroidScreen { NewsScreen() })
                (router as AndroidRouter).NavHostContent() // Cast to AndroidRouter
            }
        }
    }
}