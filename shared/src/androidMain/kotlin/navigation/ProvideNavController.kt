package navigation

import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.navigation.NavHostController

val LocalNavController = staticCompositionLocalOf<NavHostController> {
    error("NavController not provided")
}

@Composable
fun ProvideNavController(navController: NavHostController, content: @Composable () -> Unit) {
    CompositionLocalProvider(LocalNavController provides navController) {
        content()
    }
}