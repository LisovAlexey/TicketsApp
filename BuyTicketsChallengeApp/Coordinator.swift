//
//  Coordinator.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 05/05/2023.
//

import Foundation

class AppCoordinator: ObservableObject {
    @Published var currentView: AppView = .eventList
    
    func showScreen(view: AppView) {
        self.currentView = view
    }
    
    enum AppView {
        case eventList
        case eventDetail
        case ticketDetail
    }
}
