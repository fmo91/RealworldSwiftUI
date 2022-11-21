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
                ForEach(viewModel.articles, id: \.title) { article in
                    Text(article.title ?? "unnamed")
                        .padding()
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
