//
//  ArticleResponse.swift
//  NewsNow
//
//  Created by Debashree Joshi on 22/4/2023.
//

import Foundation

struct ArticleResponse: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let url: String?
    let lastModified: Int?
    let onTime: Int?
    let sponsored: Bool?
    let displayName: String?
    let assets: [Asset]?
    let relatedAssets: [RelatedAsset]?
    let relatedImages: [RelatedImage]?
    let assetType:String?
    let timeStamp: Int?
}

struct Category: Codable {
    let name: String
    let sectionPath: String
    let orderNum: Int
}

struct Author: Codable {
    let name: String
    let title: String
    let email: String
    let relatedAssets: [String]
    let relatedImages: [RelatedImage]
}


struct Company: Codable {
    let id: Int
    let companyCode: String?
    let companyName: String?
    let abbreviatedName: String?
    let exchange: String?
    let companyNumber: String?
}

struct Source: Codable {
    let tagId: String
}

struct Overrides: Codable {
    let overrideHeadline: String
    let overrideAbstract: String
}

struct RelatedAsset: Codable {
    let id: Int
    let categories: [Category]
    let authors: [Author]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let assetType: String
    let headline: String
    let timeStamp: Int
}
