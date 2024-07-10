package screens

import androidx.compose.ui.window.ComposeUIViewController
import navigation.Router

//fun NewsViewController(router: Router) = ComposeUIViewController { NewsScreen() }

fun NewsViewController(router: Router) = ComposeUIViewController {
    SafeArea {
        NewsScreen()
    }
}