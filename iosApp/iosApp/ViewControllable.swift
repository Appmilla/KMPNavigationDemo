import Foundation
import SwiftUI
import UIKit

public class NavStackHolder {
    public weak var viewController: UIViewController?
    
    public init() {}
}

public protocol ViewControllable: View {
    associatedtype VM
    var viewModel: VM? { get set }
    var holder: NavStackHolder { get set }
    
    func loadView()
    func viewOnAppear(viewController: UIViewController)
}
