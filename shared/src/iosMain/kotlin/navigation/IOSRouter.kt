package navigation

import platform.UIKit.UINavigationController
import platform.UIKit.UIViewController

class IOSRouter(private val navigationController: UINavigationController) : Router {
    val routes = mutableMapOf<String, () -> UIViewController>()

    override fun navigate(uri: String) {
        routes[uri]?.let { createViewController ->
            val viewController = createViewController()
            navigationController.pushViewController(viewController, true)
        }
    }

    override fun registerRoute(uri: String, screen: Screen) {
        routes[uri] = (screen as? IOSScreen)?.createViewController ?: { UIViewController() }
    }
}

class IOSScreen(val createViewController: () -> UIViewController) : Screen