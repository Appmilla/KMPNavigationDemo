package navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

class AndroidScreen(val composable: @Composable () -> Unit) : Screen

class AndroidRouter(private val navController: NavHostController) : Router {
    private val routes = mutableMapOf<String, @Composable () -> Unit>()

    override fun navigate(uri: String) {
        navController.navigate(uri)
    }

    override fun pop() {
        navController.popBackStack()
    }

    override fun registerRoute(uri: String, screen: Screen) {
        val composable = (screen as? AndroidScreen)?.composable ?: return
        routes[uri] = composable
    }

    @Composable
    fun NavHostContent() {
        NavHost(navController = navController, startDestination = "/screens/home") {
            routes.forEach { (uri, composable) ->
                composable(uri) { composable() }
            }
        }
    }
}

// Helper function to remember the nav controller and router
@Composable
fun rememberRouter(): AndroidRouter {
    val navController = rememberNavController()
    return AndroidRouter(navController)
}