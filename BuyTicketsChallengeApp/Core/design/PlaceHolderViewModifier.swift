//
//  PlaceHolderViewModifier.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import SwiftUI


struct Placeholder: ViewModifier {
    
    @State private var condition: Bool = false
    func body(content: Content) -> some View {
        
        content
            .redacted(reason: .placeholder)
            .opacity(condition ? 0.3 : 1.0)
            .animation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: true), value: condition)
            .onAppear { condition = true }
            .transition(.scale) // disables transition animation bug
        
    }
}
