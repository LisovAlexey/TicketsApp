//
//  EventsOverview.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import SwiftUI

struct EventsOverview: View {
    
    @StateObject var viewModel = EventsOverviewDataModel()
    
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
//                EventDetailsView(eventUuid: eventPreview.id!)
                EventDetailsView(viewModel: EventDetailsViewModel(eventUuid: eventPreview.id!))
                
            }
            .navigationTitle("Events list")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                Menu(content: {
                    Picker("Sorting by", selection: $viewModel.sorting, content: {
                        Text("By date").tag(EventsOverviewDataModel.SortingBy.date)
                        Text("By price").tag(EventsOverviewDataModel.SortingBy.price)
                    })
                    
                    Picker("Sorting order", selection: $viewModel.ascendingSort, content: {
                        Text("Ascending").tag(true)
                        Text("Descending").tag(false)
                    })
                    
                    Toggle("Filter past events", isOn: $viewModel.filterPastEvents)
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                })
                .padding(.horizontal, 10)
            }
        }
        
        
    }
}

struct EventsOverview_Previews: PreviewProvider {
    static var previews: some View {
        EventsOverview()
    }
}
