//
//  APIClient.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import Foundation

final class APIClient {
    private let networkClient: NetworkClientType
    
    static let shared = APIClient(
        networkClient: NetworkClient(
            baseURL: "https://realworld.rakkasjs.org/api"
        )
    )
    
    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
    
    func getArticles() async throws -> ArticlesResponse {
        return try await networkClient.perform(
            request: Request(
                path: "/articles",
                headers: ["Content-Type": "application/json"]
            )
        )
    }
}
