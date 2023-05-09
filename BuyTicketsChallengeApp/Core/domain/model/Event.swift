//
//  Event.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation

struct Event: Decodable {
    var id: UUID?
    var title: String
    var description: String
    var date: Date
    var price: Float
    var address: String
    var contactPhone: String
}


