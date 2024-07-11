import SwiftUI
import Kingfisher
import Shared

struct NewsListItem: View {
    let article: Article

    var body: some View {
        HStack {
            if let imageUrl = URL(string: article.urlToImage) {
                KFImage(imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.trailing, 8)
            }

            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                
                Text(article.description_)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .onAppear(){
            print("title: " + article.title)
            print("description: " + article.description)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
    }
}



