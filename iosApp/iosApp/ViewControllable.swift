import Foundation
import SwiftUI
import UIKit

public class NavStackHolder {
    public weak var viewController: UIViewController?
    
    public init() {}
}

public protocol ViewControllable: View {
    var holder: NavStackHolder { get set }
    
    func loadView()
    func viewOnAppear(viewController: UIViewController)
}

public extension ViewControllable {
    var viewController: UIViewController {
        let viewController = HostingController(rootView: self)
        self.holder.viewController = viewController
        return viewController
    }
    
    func loadView() {}
    func viewOnAppear(viewController: UIViewController) {}
}

protocol HostingControllerProtocol: UIViewController {
    func loadViewContent()
    func viewOnAppearContent(viewController: UIViewController)
}

public class HostingController<ContentView>: UIHostingController<ContentView>, HostingControllerProtocol where ContentView: ViewControllable {
    public override func loadView() {
        super.loadView()
        self.rootView.loadView()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootView.viewOnAppear(viewController: self)
    }

    func loadViewContent() {
        self.rootView.loadView()
    }

    func viewOnAppearContent(viewController: UIViewController) {
        self.rootView.viewOnAppear(viewController: viewController)
    }
}
