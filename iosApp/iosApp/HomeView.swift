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
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionView(
                    title: "SwiftUI News Screen",
                    subtitle: "Explore the latest news",
                    description: "View the most recent news articles and updates in this section.",
                    buttonText: "Go to News Screen",
                    buttonAction: { observedViewModel?.navigateToNews() }
                )
                SectionView(
                    title: "UIKit Screen",
                    subtitle: "UIKit Integration",
                    description: "Experience the seamless integration with UIKit.",
                    buttonText: "Goto UIKit",
                    buttonAction: { observedViewModel?.navigateToUIKit() }
                )
                SectionView(
                    title: "Compose News Screen",
                    subtitle: "Explore the latest news",
                    description: "Check out the Compose Multiplatform version of the News screen.",
                    buttonText: "Go to News CMP",
                    buttonAction: { observedViewModel?.navigateToSharedNews() }
                )
            }
            .padding()
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

struct SectionView: View {
    var title: String
    var subtitle: String
    var description: String
    var buttonText: String
    var buttonAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .padding(.bottom, 2)
            Text(subtitle)
                .font(.headline)
                .foregroundColor(.gray)
            Text(description)
                .font(.body)
                .foregroundColor(.black)
                .padding(.bottom, 10)
            Button(action: buttonAction) {
                Text(buttonText)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
    }
}

