import Foundation
import SwiftUI
import UIKit
import Shared
import Combine

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: NSObject, Coordinator, ObservableObject {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func start() {
        let router = DarwinRouter(navigationController: navigationController)
        setupRoutes(router: router)
        router.navigate(uri: "/screens/home")
    }

    private func setupRoutes(router: DarwinRouter) {
        
        router.registerRoute(uri: "/screens/home", screen: DarwinScreen {
            let homeView = HomeView(router: router, holder: NavStackHolder())
            let hostingController = HostingController(rootView: homeView)
            return hostingController
        })
        
        router.registerRoute(uri: "/screens/news", screen: DarwinScreen {
            let newsView = NewsView(router: router, holder: NavStackHolder())
            let hostingController = HostingController(rootView: newsView)
            return hostingController
        })

        router.registerRoute(uri: "/screens/newsCMP", screen: DarwinScreen {
            let newsComposeViewController = NewsViewControllerKt.NewsViewController(router: router)
            newsComposeViewController.navigationItem.title = "News CMP"
            return newsComposeViewController
        })
        router.registerRoute(uri: "/screens/uikit", screen: DarwinScreen {
            UIKitViewController(router: router)
        })
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let controllable = viewController as? HostingControllerProtocol {
            controllable.loadViewContent()
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let controllable = viewController as? HostingControllerProtocol {
            controllable.viewOnAppearContent(viewController: viewController)
        }
    }
}
