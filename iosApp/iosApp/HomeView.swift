import SwiftUI
import Shared

struct HomeView: ViewControllable {
    var router: DarwinRouter
    var holder = NavStackHolder()

    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
            Button(action: {
                router.navigate(uri: "/screens/news")
            }) {
                Text("Go to News Screen")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            Button(action: {
                router.navigate(uri: "/screens/uikit")
            }) {
                Text("Goto UIKit")
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            Button(action: {
                router.navigate(uri: "/screens/newsCMP")
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
