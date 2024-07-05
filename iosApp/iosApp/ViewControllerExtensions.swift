import UIKit

extension UIViewController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let controllable = viewController as? any ViewControllable {
            controllable.loadView()
        }
    }

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let controllable = viewController as? any ViewControllable {
            controllable.viewOnAppear(viewController: viewController)
        }
    }
}


