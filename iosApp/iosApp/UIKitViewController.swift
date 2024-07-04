import UIKit

import UIKit
import Shared

class UIKitViewController: UIViewController {
    private let router: DarwinRouter

    init(router: DarwinRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("Goto Home", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToHome), for: .touchUpInside)

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.navigationItem.title = "UIKit"
    }

    @objc private func goToHome() {
        print("UIKitViewController: Button pressed, navigating to Home Screen")
        router.navigate(uri: "/screens/home")
    }
}


