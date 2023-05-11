//
//  TicketsStorage.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 11/05/2023.
//

import Foundation

protocol TicketsStorageProtocol {
    
    var dataCoder: DataCoderProtocol { get }
    
    func getTicket(by eventUuid: UUID) -> EventTicket?
    func saveTicket(ticket: EventTicket)
}


class UserDefaultsTicketsStorage: TicketsStorageProtocol {
    
    var dataCoder: DataCoderProtocol = DataCoder()
    
    var storage: UserDefaults = UserDefaults.standard
    var dataParser: DataParserProtocol = DataParser()
    
    func getTicket(by eventUuid: UUID) -> EventTicket? {
        
        print("trying to read for key: \(eventUuid.uuidString)" )
        guard let data = storage.object(forKey: eventUuid.uuidString) as? Data else {
            print("Data not found in storage")
            return nil
        }
        
        guard let ticket: EventTicket = try? dataCoder.decode(data: data) else {
            return nil
        }
        
        return ticket
    }
    
    func saveTicket(ticket: EventTicket) {
        guard let data = try? dataCoder.encode(value: ticket) else {
            fatalError("Warning: ticket not saved")
        }
        
        print("trying to save for key: \(ticket.eventId.uuidString)" )
        storage.set(data, forKey: ticket.eventId.uuidString)
    }
    
    
}
