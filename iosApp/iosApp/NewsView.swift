import SwiftUI
import Shared


struct NewsView: ViewControllable {
    // Use a property without the wrapper for protocol conformance
    var viewModel: NewsViewModel?
    var holder = NavStackHolder()

    // Computed property to provide @ObservedObject
    var observedViewModel: NewsViewModel? {
        get { viewModel }
        set { viewModel = newValue }
    }

    var body: some View {
        NavigationView {

            Observing(observedViewModel!.articles) { articles  in
                List(articles, id: \.self) { article in
                    NewsListItem(article: article)
            }
            .listStyle(PlainListStyle())
        }
        }
        .onAppear {
            observedViewModel?.fetchNews()
        }
    }

    func loadView() {
        // Additional setup if needed
    }

    func viewOnAppear(viewController: UIViewController) {
        // Additional actions when the view appears
    }
}

/*
// This version works equally well
struct NewsView: ViewControllable {
    // Use a property without the wrapper for protocol conformance
    var viewModel: NewsViewModel?
    var holder = NavStackHolder()

    // Computed property to provide @ObservedObject
    var observedViewModel: NewsViewModel? {
        get { viewModel }
        set { viewModel = newValue }
    }

    @State
    private var boundArticles: [Article] = []
    
    var body: some View {
        NavigationView {
            List(boundArticles, id: \.url){ article in
                NewsListItem(article: article)
            }
            .collect(flow: observedViewModel!.articles, into: $boundArticles)
            .listStyle(PlainListStyle())
        }
        .onAppear {
            observedViewModel?.fetchNews()
                    
        }
    }

    func loadView() {
        // Additional setup if needed
    }

    func viewOnAppear(viewController: UIViewController) {
        // Additional actions when the view appears
    }
}
*/

