import SwiftUI
import Shared


import SwiftUI
import Shared

struct HomeView: View {
    @EnvironmentObject var router: DarwinRouter

    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
            Button(action: {
                print("HomeView: Button pressed, navigating to News Screen")
                router.navigate(uri: "/screens/news")
            }) {
                Text("Go to News Screen")
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            Button(action: {
                print("HomeView: Button pressed, navigating to UIKit Screen")
                router.navigate(uri: "/screens/uikit")
            }) {
                Text("Goto UIKit")
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            Button(action: {
                print("HomeView: Button pressed, navigating to News CMP Screen")
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
        .onAppear {
            print("HomeView: Appeared")
        }
        .navigationTitle("Home SwiftUI")
    }
}
