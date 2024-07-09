import SwiftUI
import Shared

struct HomeView: ViewControllable {
    // Use a property without the wrapper for protocol conformance
    var viewModel: HomeViewModel?
    var holder = NavStackHolder()

    // Computed property to provide @ObservedObject
    var observedViewModel: HomeViewModel? {
        get { viewModel }
        set { viewModel = newValue }
    }

    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
            Button(action: {
                observedViewModel?.navigateToNews()
            }) {
                Text("Go to News Screen")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            Button(action: {
                observedViewModel?.navigateToUIKit()
            }) {
                Text("Goto UIKit")
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            Button(action: {
                observedViewModel?.navigateToSharedNews()
            }) {
                Text("Go to News CMP")
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }

    func loadView() {
        // Additional setup if needed
    }

    func viewOnAppear(viewController: UIViewController) {
        // Additional actions when the view appears
    }
}
