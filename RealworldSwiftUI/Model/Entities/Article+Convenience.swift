//
//  Article+Convenience.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import Foundation

extension Article: Identifiable {
    var id: String {
        "\(title ?? "")\(createdAt ?? "")"
    }
}

extension Article {
    var createdAtDate: Date? {
        guard let createdAt = self.createdAt else {
            return nil
        }
        
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return dateFormatter.date(from: createdAt)
    }
    
    var timeAgo: String {
        guard let createdAtDate = self.createdAtDate else {
            return ""
        }
        
        return createdAtDate.timeAgo
    }
}

extension Date {
    var timeAgo: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: .current)
    }
}
