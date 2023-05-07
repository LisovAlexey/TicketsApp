//
//  Model.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 05/05/2023.
//

import Foundation


struct Event {
    
    var id: UUID?
    
    var title: String
    var description: String
    var date: Date
    var price: Float
    var address: String
    var contactPhone: String
    
}


struct EventPreview {
    
    static var mock: EventPreview =
    EventPreview(title: "Concert in hell",
                 date: Date.init(timeIntervalSince1970: 1_693_968_000),
                 price: 25.5)

    var id: UUID?
    
    var title: String
    var date: Date
    var price: Float

}

struct EventTicket {
    
    var id: UUID?
    
    var qrCodeEncoding: String
    var date: Date
    var eventId: UUID
    
//    init() { }
//
//    init(id: UUID? = nil, date: Date, eventId: UUID) {
//        self.id = id
//        self.date = date
//        self.eventId = eventId
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case date = "date"
//        case eventId = "event_id"
//        case qrCodeEncoding = "qr_code_encoding"
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(date, forKey: .date)
//        try container.encode(eventId, forKey: .eventId)
//        try container.encode(qrCodeEncoding, forKey: .qrCodeEncoding)
//    }
}


