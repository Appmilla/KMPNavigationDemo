import UIKit
import Shared

class ViewModelWrapperViewController: UIViewController, ViewModelStoreOwner {
    private let wrappedViewController: UIViewController
    internal let viewModelStore = ViewModelStore()

    init(wrappedViewController: UIViewController) {
        self.wrappedViewController = wrappedViewController
        super.init(nibName: nil, bundle: nil)
        addChild(wrappedViewController)
        view.addSubview(wrappedViewController.view)
        wrappedViewController.didMove(toParent: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        wrappedViewController.view.frame = view.bounds
        wrappedViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wrappedViewController.beginAppearanceTransition(true, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        wrappedViewController.endAppearanceTransition()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        wrappedViewController.beginAppearanceTransition(false, animated: animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        wrappedViewController.endAppearanceTransition()
        viewModelStore.clear()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        wrappedViewController.view.frame = view.bounds
    }

    func getViewModelStore() -> ViewModelStore {
        return viewModelStore
    }
}
