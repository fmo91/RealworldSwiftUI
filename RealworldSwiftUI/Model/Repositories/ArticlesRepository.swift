//
//  ArticlesRepository.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import Foundation

final class ArticlesRepository {
    func getHomeArticles() async throws -> [Article] {
        let articlesResponse = try await APIClient.shared.getArticles()
        return articlesResponse.articles ?? []
    }
}
