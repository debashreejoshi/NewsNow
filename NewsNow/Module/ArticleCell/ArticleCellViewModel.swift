//
//  ArticleCellViewModel.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//


struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    let publisher: String
    let thumbnail: String
    
    init(asset: Asset) {
        title = asset.headline ?? ""
        description = asset.theAbstract
        date = asset.formattedTimestamp
        publisher = asset.byLine
        thumbnail = asset.relatedImages.min { $0.width < $1.width }?.url ?? ""
    }
}
