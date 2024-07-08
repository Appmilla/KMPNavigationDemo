package navigation

import platform.UIKit.UINavigationController
import platform.UIKit.UIViewController


class DarwinRouter(private val navigationController: UINavigationController) : Router {
    private val routes = mutableMapOf<String, () -> UIViewController>()

    override fun navigate(uri: String) {
        routes[uri]?.let { createViewController ->
            val viewController = createViewController()
            navigationController.pushViewController(viewController, true)
        }
    }

    override fun pop() {
        navigationController.popViewControllerAnimated(true)
    }

    override fun registerRoute(uri: String, screen: Screen) {
        routes[uri] = (screen as? DarwinScreen)?.createViewController ?: { UIViewController() }
    }
}

class DarwinScreen(val createViewController: () -> UIViewController) : Screen