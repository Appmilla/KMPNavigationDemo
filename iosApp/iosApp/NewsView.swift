import SwiftUI
import Shared

struct NewsView: View {
    @EnvironmentObject var router: IOSRouter

    var body: some View {
        VStack {
            Text("News Screen")
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
            Button(action: {
                print("NewsView: Button pressed, navigating to Home Screen")
                router.navigate(uri: "/screens/home")
            }) {
                Text("Go to Home Screen")
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .onAppear {
            print("NewsView: Appeared")
        }
    }
}
