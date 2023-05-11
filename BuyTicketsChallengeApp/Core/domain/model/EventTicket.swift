//
//  EventTicket.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation


struct EventTicket: Codable {
    
    static var mock: EventTicket = EventTicket(qrCodeEncoding: "This is mock ticket", date: Date.now, eventId: UUID())
    
    var id: UUID?
    
    var qrCodeEncoding: String
    var date: Date
    var eventId: UUID
}
