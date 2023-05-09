//
//  EventTicket.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation


struct EventTicket: Decodable {
    
    var id: UUID?
    
    var qrCodeEncoding: String
    var date: Date
    var eventId: UUID
}
