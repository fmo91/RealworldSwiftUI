//
//  HomeScreen.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.articles) { article in
                    ArticleView(article: article)
                }
            }
        }
        .task {
            await viewModel.loadArticles()
        }
    }
}

#if DEBUG
struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
#endif
