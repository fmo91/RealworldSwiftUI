//
//  Article.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import Foundation

struct ArticlesResponse: Decodable {
    let articles: [Article]?
}

struct Article: Decodable {
    let slug: String?
    let title: String?
    let articleDescription: String?
    let body: String?
    let createdAt: String?
    let updatedAt: String?
    let author: Author?
    let tagList: [String]?
    let favorited: Bool?
    let favoritesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case slug
        case title
        case articleDescription = "description"
        case body
        case createdAt
        case updatedAt
        case author
        case tagList
        case favorited
        case favoritesCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.articleDescription = try container.decodeIfPresent(String.self, forKey: .articleDescription)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        self.author = try container.decodeIfPresent(Author.self, forKey: .author)
        self.tagList = try container.decodeIfPresent([String].self, forKey: .tagList)
        self.favorited = try container.decodeIfPresent(Bool.self, forKey: .favorited)
        self.favoritesCount = try container.decodeIfPresent(Int.self, forKey: .favoritesCount)
    }
}

struct Author: Decodable {
    let username: String?
    let bio: String?
    let image: String?
    let following: Bool?
    
    enum CodingKeys: String, CodingKey {
        case username
        case bio
        case image
        case following
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.following = try container.decodeIfPresent(Bool.self, forKey: .following)
    }
}
