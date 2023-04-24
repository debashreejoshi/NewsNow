//
//  Asset.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import Foundation

struct Asset: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let url: String
    let lastModified: Int?
    let sponsored: Bool?
    let headline: String?
    let indexHeadline: String?
    let tabletHeadline: String
    let theAbstract: String
    let byLine: String
    let acceptComments: Bool
    let numberOfComments: Int
    let relatedAssets: [RelatedAsset]
    let relatedImages: [RelatedImage]
    let signPost: String?
    let companies: [Company]?
    let legalStatus: String
    let sources: [Source]
    let assetType: String
    let overrides: Overrides
    var timeStamp: Int
    
    var formattedTimestamp: String {
        // Computed property to format timestamp into a readable date string
        let date = Date(timeIntervalSince1970: Double(timeStamp) / 1000)
        return DateFormatter.articleAPIDateFormatter.string(from: date)
    }
}
