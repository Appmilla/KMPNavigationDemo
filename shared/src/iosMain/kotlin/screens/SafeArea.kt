package screens

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.unit.dp
import kotlinx.cinterop.ExperimentalForeignApi
import kotlinx.cinterop.useContents
import platform.UIKit.*

@OptIn(ExperimentalForeignApi::class)
@Composable
fun SafeArea(content: @Composable () -> Unit) {
    val window = UIApplication.sharedApplication.keyWindow
    val density = LocalDensity.current

    // Remember the safe area insets and navigation bar height
    val (topPadding, bottomPadding) = remember(window) {
        val insets = window?.safeAreaInsets
        val navBarHeight = getNavigationBarHeight(window?.rootViewController)
        val topPadding = insets?.useContents { top + navBarHeight } ?: 0.0
        val bottomPadding = insets?.useContents { bottom } ?: 0.0
        Pair(topPadding, bottomPadding)
    }

    Box(modifier = Modifier.padding(top = with(density) { topPadding.toFloat().dp }, bottom = with(density) { bottomPadding.toFloat().dp })) {
        content()
    }
}

@OptIn(ExperimentalForeignApi::class)
fun getNavigationBarHeight(viewController: UIViewController?): Double {
    var uiViewController = viewController
    var height = 0.0
    while (uiViewController != null) {
        if (uiViewController is UINavigationController) {
            uiViewController.navigationBar.frame.useContents {
                height = size.height
            }
        }
        uiViewController = uiViewController.presentedViewController
    }
    return height
}