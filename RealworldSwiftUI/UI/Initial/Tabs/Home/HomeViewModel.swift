//
//  HomeViewModel.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import Foundation

@MainActor final class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    private let articlesRepository = ArticlesRepository()
    
    func loadArticles() async {
        self.articles = (try? await articlesRepository.getHomeArticles()) ?? []
    }
}
