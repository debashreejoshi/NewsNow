//
//  DateFormatter+Extension.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import Foundation

// Extend the DateFormatter class
extension DateFormatter {
    
    // Create a static property that returns a DateFormatter object with specific settings
    static let articleAPIDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy - h.mma" // set date format to "Month day, year - hour.minutes AM/PM"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // set timezone to Coordinated Universal Time (UTC)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to US English POSIX
        return dateFormatter // return the configured DateFormatter object
    }()
}
