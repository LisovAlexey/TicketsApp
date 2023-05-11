//
//  EventDetailsView.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import SwiftUI

struct EventDetailsView: View {
    
    @StateObject var viewModel: EventDetailsViewModel
    
    var event: Event {
        if viewModel.screenStatus == .screenLoading {
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
                .redacted(when: viewModel.screenStatus == .screenLoading)
            
            Spacer()
            
            if viewModel.screenStatus <= .ticketBuying {
                buyButton
            } else {
                viewTicketButton
            }
        }
        .task {
            await viewModel.fetchData()
        }
        .sheet(isPresented: $viewModel.showTicket) {
            Text("Ticket")
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
            
            if viewModel.screenStatus == .ticketBuying {
                
                HStack {
                    Text(" ")
                    ProgressView()
                    Text(" ")
                }
                .bold()
                .font(.title2)
                
            } else {
                HStack {
                    Text("Buy ticket:")
                    
                    Spacer()
                    
                    Text(String(format: "£%.01f", event.price))
                        .bold()
                    
                }
                .padding(.horizontal, 15).font(.title2)
                .redacted(when: viewModel.screenStatus == .screenLoading)
            }
            

        }
        .buttonStyle(CapsuleButton())
        .padding()
    }
    
    var viewTicketButton: some View {
        Button {
            viewModel.showTicket = true
        } label: {
            Text("Show ticket")
                .padding(.horizontal, 15)
                .font(.title2)
                .bold()
        }
        .buttonStyle(CapsuleButton())
        .padding()
    }
}


struct EventDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let uuid = UUID(uuidString: "9F1A13B2-76F5-4205-A0D4-15A975B53262")!
        var viewModel = EventDetailsViewModel(eventUuid: uuid)
        
//        EventDetailsView(eventUuid: )
        return EventDetailsView(viewModel: viewModel)
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
