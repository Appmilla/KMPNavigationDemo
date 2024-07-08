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
    }

    func start() {
        let router = KotlinDependencies.shared.getRouter()
        setupRoutes(router: router)
        router.navigate(uri: "/screens/home")
    }

    private func setupRoutes(router: Router) {
        router.registerRoute(uri: "/screens/home", screen: DarwinScreen {
            let homeViewModel = KotlinDependencies.shared.getHomeViewModel()
            let homeView = HomeView(viewModel: homeViewModel, holder: NavStackHolder())
            let hostingController = ViewModelHostingController(rootView: homeView)
            return hostingController
        })

        router.registerRoute(uri: "/screens/news", screen: DarwinScreen {
            let newsViewModel = KotlinDependencies.shared.getNewsViewModel()
            let newsView = NewsView(viewModel: newsViewModel, holder: NavStackHolder())
            let hostingController = ViewModelHostingController(rootView: newsView)
            return hostingController
        })

        router.registerRoute(uri: "/screens/newsCMP", screen: DarwinScreen {
            let newsComposeViewController = NewsViewControllerKt.NewsViewController(router: router)
            newsComposeViewController.navigationItem.title = "News CMP"
            let wrapperViewController = ViewModelWrapperViewController(wrappedViewController: newsComposeViewController)
            return wrapperViewController
        })
        
        router.registerRoute(uri: "/screens/uikit", screen: DarwinScreen {
            UIKitViewController(router: router)
        })
    }
}
