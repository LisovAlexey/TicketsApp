//
//  EventDetailsView.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation
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
    
    func fetchData() {
        Task {
            do {
                let event: Event = try await requestManager.perform(EventsDetailsRequest.getEventByUUID(uuid: eventUuid))
                
                DispatchQueue.main.async { [weak self] in
                    self?.event = event
                    self?.isLoading = false
                }
            } catch {
                print(error)
                print("Request failed")
            }
        }
    }
    
    func buyTicket() {
        
    }
}


struct Placeholder: ViewModifier {
    
    @State private var condition: Bool = false
    func body(content: Content) -> some View {

        content
            .redacted(reason: .placeholder)
            .opacity(condition ? 0.3 : 1.0)
            .animation(.easeInOut(duration: 1)
                       .repeatForever(autoreverses: true), value: condition)
//                .animation(Animation
//                    .easeInOut(duration: 1)
//                    .repeatForever(autoreverses: true), value: condition)
            .onAppear { condition = true }
            .transition(.scale)
        
        
    }
}

struct EventDetailsView: View {
    
    init(eventUuid: UUID) {
        self.viewModel = EventDetailsViewModel(eventUuid: eventUuid)
    }
    
    @ObservedObject var viewModel: EventDetailsViewModel
    
    var event: Event {
        if viewModel.isLoading {
            return Event.mock
        } else {
            if let event = viewModel.event {
                return event
            } else {
                // error
                return Event.mock
            }
        }
    }
    
    var body: some View {
        
        VStack {
            
            eventDetailsStack
                .redacted(when: viewModel.isLoading)
            
            Spacer()
            
            if !viewModel.wasBought {
                buyButton
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    var eventDetailsStack: some View {
        VStack(spacing: 20) {
            
            Text(event.title)
                .font(.title)
                .bold()
            
            Text(event.description)
            
            HStack(spacing: 20) {
                
                Text("Date:")
                Spacer()
                Text(DateFormatter.defaultDateFormatter.string(from: event.date))
                    .bold()
                    
            }
            
            HStack(spacing: 20) {
                
                Text("Address:")
                Spacer()
                Text(event.address)
                    .bold()
            }
            
            HStack(spacing: 20) {
                
                Text("Contact phone:")
                Spacer()
                Text(event.contactPhone)
                    .bold()
            }
        }.padding()
    }
    
    var buyButton: some View {
        Button {
            viewModel.buyTicket()
        } label: {
            HStack {
                Text("Buy ticket:")
                
                Spacer()
                
                Text(String(format: "£%.01f", event.price))
                    .bold()
                
            }
            .padding(.horizontal, 15).font(.title2)
            .redacted(when: viewModel.isLoading)

        }
        .buttonStyle(CapsuleButton())
        .padding()
    }
}


struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(eventUuid: UUID(uuidString: "9F1A13B2-76F5-4205-A0D4-15A975B53262")!)
    }
}


extension View {
    @ViewBuilder
    func redacted(when condition: Bool) -> some View {
        if condition {
            self.modifier(Placeholder())
        } else {
            unredacted()
        }
    }
}
