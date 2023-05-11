//
//  EventDetailsViewModel.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import SwiftUI

class EventDetailsViewModel: ObservableObject {
    
    init (eventUuid: UUID,
          requestManager: RequestManagerProtocol = RequestManager()) {
        self.eventUuid = eventUuid
        self.requestManager = requestManager
    }
    
    let eventUuid: UUID
    let requestManager: RequestManagerProtocol
    @Published var event: Event?
    @Published var wasBought: Bool = false
    @Published var isLoading: Bool = true
    
    func fetchData() async {
        
        do {
            let event: Event = try await requestManager.perform(EventsDetailsRequest.getEventByUUID(uuid: eventUuid))
            
            DispatchQueue.main.async { [unowned self] in
                self.event = event
                self.isLoading = false
            }
        } catch {
            print(error)
            print("Request failed")
        }
        
    }
    
    func buyTicket() {
        wasBought = true
    }
}
