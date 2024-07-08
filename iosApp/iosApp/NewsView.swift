import SwiftUI
import Shared

struct NewsView: ViewControllable {
    var viewModel: NewsViewModel?
    var holder = NavStackHolder()

    var body: some View {
        VStack {
            Text("News Screen")
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
            Button(action: {
                viewModel?.navigateBack()
            }) {
                Text("Go to Home Screen")
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }

    func loadView() {
        // Additional setup if needed
    }

    func viewOnAppear(viewController: UIViewController) {
        // Additional actions when the view appears
    }
}
