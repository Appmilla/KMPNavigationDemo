package screens

import androidx.compose.ui.window.ComposeUIViewController
import navigation.Router

fun NewsViewController(router: Router) = ComposeUIViewController { NewsScreen(router) }
