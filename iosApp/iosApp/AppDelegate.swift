import UIKit
import SwiftUI
import Shared

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let navigationController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navigationController)
        self.coordinator = coordinator

        let router = DarwinRouter(navigationController: navigationController)
        Koin.start(router: router)
        
        coordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return true
    }
}
