//
//  RelatedImage.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import Foundation

struct RelatedImage: Codable {
    let id: Int
    let categories: [Category]
    let brands: [String]
    let authors: [Author]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let description: String
    let photographer: String
    let type: String
    let width: Int
    let height: Int
    let assetType: String
    let timeStamp: Int
}
