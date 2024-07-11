package screens

import androidx.compose.ui.window.ComposeUIViewController
import navigation.Router

fun HomeViewController(router: Router) = ComposeUIViewController {
    SafeArea {
        HomeScreen()
    }
}