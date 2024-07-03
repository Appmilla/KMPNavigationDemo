import UIKit

extension UINavigationController: ObservableObject {
    func navigateTo(route: AppRoute) {
        AppNavigation.shared.navigate(route, source: self)
    }

    func presentScreen(route: AppRoute) {
        AppNavigation.shared.present(route, source: self)
    }

    func pop() {
        popViewController(animated: true)
    }

    func popToRoot() {
        popToRootViewController(animated: true)
    }
}



