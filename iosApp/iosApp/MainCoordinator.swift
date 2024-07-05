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
    }

    func start() {
        let router = DarwinRouter(navigationController: navigationController)
        setupRoutes(router: router)
        router.navigate(uri: "/screens/home")
    }

    private func setupRoutes(router: DarwinRouter) {
            router.registerRoute(uri: "/screens/home", screen: DarwinScreen {
                UIHostingController(rootView: HomeView().environmentObject(router))
            })
            router.registerRoute(uri: "/screens/news", screen: DarwinScreen {
                UIHostingController(rootView: NewsView().environmentObject(router))
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

