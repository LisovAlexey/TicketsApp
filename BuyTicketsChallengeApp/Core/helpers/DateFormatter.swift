//
//  DateFormatter.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import Foundation

extension DateFormatter {
    static var defaultDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter
    }
}

extension Date {
    var formatAsDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    var formatAsDateAndTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM / HH:mm"
        return dateFormatter.string(from: self)
    }
}
