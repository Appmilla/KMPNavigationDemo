import UIKit
import SwiftUI
import Shared

class ViewModelHostingController<ContentView: ViewControllable, VM: ViewModel>: UIHostingController<ContentView>, ViewModelStoreOwner where ContentView.VM == VM {
    internal let viewModelStore = ViewModelStore()
    var viewModel: VM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resolveViewModel()

        // Configure the rootView with the resolved ViewModel
        if let viewModel = viewModel {
            rootView.viewModel = viewModel
        }

        print("ViewModelHostingController.viewModel: \(String(describing: viewModel))")
        rootView.loadView()
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

    private func resolveViewModel() {
        let resolver = ViewModelResolver()
        let kclassProvider = KClassProvider()
        let kclass = kclassProvider.getKClass(objCClass: VM.self)

        viewModel = resolver.resolveViewModel(vmClass: kclass, viewModelStore: viewModelStore, key: nil) as? VM

        if viewModel == nil {
            print("ERROR: Failed to resolve or cast ViewModel")
        }
    }
}
