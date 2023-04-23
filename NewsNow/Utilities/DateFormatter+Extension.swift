//
//  DateFormatter+Extension.swift
//  NewsNow
//
//  Created by Debashree Joshi on 23/4/2023.
//

import Foundation

extension DateFormatter {
    static let articleAPIDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy - h.mma"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()
}
