//
//  EventsOverviewDataModel.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//


import SwiftUI




class EventsOverviewDataModel: ObservableObject {
    
    enum SortingBy {
        case price, date
    }
    
    @Published var sorting: SortingBy = .date {
        didSet {
            filterAndSort()
        }
    }
    
    @Published var ascendingSort: Bool = true {
        didSet {
            filterAndSort()
        }
    }
    
    @Published var filterPastEvents: Bool = false {
        didSet {
            filterAndSort()
        }
    }
    
    var allEventPreviews: [EventPreview] = []
    @Published var eventPreviews: [EventPreview]
    
    let requestManager: RequestManagerProtocol
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
        self.allEventPreviews = []
        self.eventPreviews = []
    }
    
    func fetchEventsPreview() {
        Task {
            do {
                self.allEventPreviews = try await requestManager.perform(EventsPreviewRequest.getEvents)
                
                DispatchQueue.main.async { [weak self] in
                    self?.filterAndSort()
                }
            } catch {
                print(error)
                print("Request failed")
            }
        }
    }
    
    func filterAndSort() {
        self.eventPreviews = self.allEventPreviews
            .filter({event in
                if self.filterPastEvents {
                    return event.date >= Date.now
                } else {
                    return true
                }
            })
            .sorted(by: { event1, event2 in
            switch (sorting, ascendingSort) {
            case (.date, true):
                return event1.date < event2.date
            case (.date, false):
                return event1.date > event2.date
            case (.price, true):
                return event1.price < event2.price
            case (.price, false):
                return event1.price > event2.price
            }
        })
    }
    
    
}
