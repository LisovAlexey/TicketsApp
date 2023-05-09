//
//  EventsOverviewDataModel.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//


import SwiftUI


class EventsOverviewDataModel: ObservableObject {
    
    @Published var eventPreviews: [EventPreview]
    
    let requestManager: RequestManagerProtocol
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
        self.eventPreviews = []
    }
    
    func fetchEventsPreview() {
        
        
        
        Task {
            do {
                let events: [EventPreview] = try await requestManager.perform(EventsPreviewRequest.getEvents)
                
                DispatchQueue.main.async { [weak self] in
                    self?.eventPreviews = events
                }
            } catch {
                print(error)
                print("Request failed")
            }
        }
        
    }
}
