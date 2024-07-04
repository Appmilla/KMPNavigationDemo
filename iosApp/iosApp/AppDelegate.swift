import UIKit
import SwiftUI
import Shared

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var router: DarwinRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let navigationController = UINavigationController()
        let router = DarwinRouter(navigationController: navigationController)
        self.router = router

        setupRoutes(router: router)

        let rootViewController = UIHostingController(rootView: HomeView().environmentObject(router))
        navigationController.viewControllers = [rootViewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        print("AppDelegate: Window and navigation controller are set up with root view controller \(rootViewController)")
        print("AppDelegate: navigationController's view controllers: \(navigationController.viewControllers)")
     
        return true
    }

    private func setupRoutes(router: DarwinRouter) {
        print("AppDelegate: Setting up routes")
        
        // SwiftUI Home
        router.registerRoute(uri: "/screens/home", screen: DarwinScreen {
            UIHostingController(rootView: HomeView().environmentObject(router))
        })
        
        // SwiftUI News
        
        router.registerRoute(uri: "/screens/news", screen: DarwinScreen {
            UIHostingController(rootView: NewsView().environmentObject(router))
        })

        // Compose Multiplatform News
        let newsComposeViewController = NewsViewControllerKt.NewsViewController(router: router)
        newsComposeViewController.navigationItem.title = "News CMP"
        
        router.registerRoute(uri: "/screens/newsCMP", screen: DarwinScreen {
            newsComposeViewController
        })
        
        //UIKit screen
        router.registerRoute(uri: "/screens/uikit", screen: DarwinScreen {
                    UIKitViewController(router: router)
        })

        
        // Set the initial view
        print("AppDelegate: Setting initial view to HomeView")
        router.navigate(uri: "/screens/home")
        print("AppDelegate: Initial view set to HomeView")
    }
}
