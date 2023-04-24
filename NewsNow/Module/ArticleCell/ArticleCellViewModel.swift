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
    
    init(title: String, description: String, date: String, publisher: String, thumbnail: String) {
        self.title = title
        self.description = description
        self.date = date
        self.publisher = publisher
        self.thumbnail = thumbnail
    }
}
