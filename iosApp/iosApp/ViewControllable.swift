import Foundation
import SwiftUI
import UIKit

public class NavStackHolder {
    public weak var viewController: UIViewController?
    
    public init() {}
}

protocol ViewControllable: View {
    associatedtype VM: ObservableObject
    var viewModel: VM? { get set }
    var holder: NavStackHolder { get set }
    
    func loadView()
    func viewOnAppear(viewController: UIViewController)
}

extension ViewControllable {
    var observedViewModel: VM? {
        get { viewModel }
        set { viewModel = newValue }
    }
}
