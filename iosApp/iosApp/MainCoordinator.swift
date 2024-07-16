import Foundation
import SwiftUI
import UIKit
import Shared
import Combine

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: NSObject, Coordinator, ObservableObject {
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
            let homeView = HomeView(holder: NavStackHolder())
            let hostingController = ViewModelHostingController<HomeView, HomeViewModel>(rootView: homeView)
            hostingController.navigationItem.title = "Home"
            
            return hostingController
        })
        
        router.registerRoute(uri: "/screens/news", screen: DarwinScreen {
            let newsView = NewsView(holder: NavStackHolder())
            let hostingController = ViewModelHostingController<NewsView, NewsViewModel>(rootView: newsView)
            hostingController.navigationItem.title = "News"
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
