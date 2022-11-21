//
//  ArticleView.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    AsyncImage(url: URL(string: article.author?.image ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    Text(article.author?.username ?? "")
                        .font(.subheadline)
                }
                Text(article.title ?? "")
                    .font(.headline)
                Text("\(article.timeAgo) ago")
                    .font(.subheadline)
                Text(article.articleDescription ?? "")
                    .font(.body)
            }
            Spacer()
            Image(systemName: article.favorited == true ? "star.fill" : "star")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding()
    }
}
