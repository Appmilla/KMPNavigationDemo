import androidx.compose.material.MaterialTheme
import androidx.compose.runtime.Composable
import navigation.AndroidScreen
import navigation.rememberRouter
import org.jetbrains.compose.ui.tooling.preview.Preview
import screens.HomeScreen
import screens.NewsScreen

@Composable
@Preview
fun App() {
    MaterialTheme {
        val router = rememberRouter()
        router.registerRoute("/screens/home", AndroidScreen { HomeScreen(router) })
        router.registerRoute("/screens/news", AndroidScreen { NewsScreen(router) })
        router.NavHostContent()
    }
}