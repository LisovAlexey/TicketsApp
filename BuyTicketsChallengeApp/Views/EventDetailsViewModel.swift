//
//  EventDetailsViewModel.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import SwiftUI

extension EventDetailsViewModel.ScreenStatus: Comparable, Equatable {
    static func < (lhs: EventDetailsViewModel.ScreenStatus, rhs: EventDetailsViewModel.ScreenStatus) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    static func == (lhs: EventDetailsViewModel.ScreenStatus, rhs: EventDetailsViewModel.ScreenStatus) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}


class EventDetailsViewModel: ObservableObject {
    
    enum ScreenStatus: Int {
        case screenLoading, loaded, ticketBuying, ticketBought
    }
    
    init (eventUuid: UUID,
          requestManager: RequestManagerProtocol = RequestManager()) {
        self.eventUuid = eventUuid
        self.requestManager = requestManager
    }
    
    let eventUuid: UUID
    let requestManager: RequestManagerProtocol
    
    @Published var eventTicket: EventTicket?
    @Published var showTicket: Bool = false
    
    @Published var event: Event?
//    @Published var wasBought: Bool = false
//    @Published var isLoading: Bool = true
    
    @Published var screenStatus: ScreenStatus = .screenLoading
    
    func fetchData() async {
        
        do {
            let event: Event = try await requestManager.perform(EventsDetailsRequest.getEventByUUID(uuid: eventUuid))
            
            DispatchQueue.main.async { [unowned self] in
                self.event = event
//                self.isLoading = false
                self.screenStatus = .loaded
            }
        } catch {
            print(error)
            print("Request failed")
        }
        
    }
    
    func buyTicket() {
        
//        self.isLoadingTicket = true
        self.screenStatus = .ticketBuying
        
        Task {
            do {
                
                let ticket: EventTicket = try await requestManager.perform(EventsDetailsRequest.buyTicketByUUID(uuid: eventUuid))
                
                DispatchQueue.main.async { [unowned self] in
                    self.eventTicket = ticket
//                    self.isLoadingTicket = false
//                    self.wasBought = true
                    
                    self.screenStatus = .ticketBought
                    self.showTicket = true
                }
            } catch {
                print(error)
                print("Request failed")
            }
        }
        
        
    }
}
