//
//  EventsOverview.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import SwiftUI

struct EventsOverview: View {
    
    @ObservedObject var viewModel = EventsOverviewDataModel()
    
    @State var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            List(viewModel.eventPreviews) { eventPreview in
                
                NavigationLink(value: eventPreview) {
                    EventRowView(eventPreview: eventPreview)
                }
            }
            .onAppear() {
                viewModel.fetchEventsPreview()
            }
            .refreshable {
                viewModel.fetchEventsPreview()
            }
            .navigationDestination(for: EventPreview.self) { eventPreview in
                Text(eventPreview.id!.description)
            }
            .navigationTitle("Events list")
        }
        
        
    }
}

struct EventsOverview_Previews: PreviewProvider {
    static var previews: some View {
        EventsOverview()
    }
}
