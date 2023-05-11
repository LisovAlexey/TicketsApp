//
//  EventRowView.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 07/05/2023.
//

import SwiftUI


struct EventRowView: View {
    
    var eventPreview: EventPreview
    
    private let dateFormatter: DateFormatter = DateFormatter.defaultDateFormatter
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(eventPreview.title)
                    .font(.headline)
                
                Text(
                    self.dateFormatter.string(from: eventPreview.date))
                    .font(.subheadline)
                    .foregroundColor(.init(white: 0.2))
                
            }
            
            Spacer()
            
            Text(String(format: "£%.01f", eventPreview.price))
                .font(.title2)
                .bold()
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(eventPreview: EventPreview.mock)
    }
}
