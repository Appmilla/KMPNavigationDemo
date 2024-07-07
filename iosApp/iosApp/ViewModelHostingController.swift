import UIKit
import SwiftUI
import Shared

class ViewModelHostingController<ContentView>: UIHostingController<ContentView>, ViewModelStoreOwner where ContentView: ViewControllable {
    internal let viewModelStore = ViewModelStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.loadView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootView.viewOnAppear(viewController: self)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModelStore.clear()
    }

    func getViewModelStore() -> ViewModelStore {
        return viewModelStore
    }
}
