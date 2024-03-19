import SwiftUI

// ReadOnlyScreenの修正版
struct ReadOnlyScreen: View {
    var articleModel = ArticleModel() // ArticleModelのインスタンスを作成

    var body: some View {
        VStack {
            List(articleModel.article, id: \.id) { article in // ArticleElementのリストを表示
                ArticleView(article: article)
            }
        }
    }
}

// ArticleViewの修正版
struct ArticleView: View {
    let article: ArticleElement // ArticleElementを受け取る

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title) // タイトルを表示
                .font(.headline)
            Text(changeMarkdownText(article.content)) // コンテンツを表示
                .font(.body)
        }
    }
}

