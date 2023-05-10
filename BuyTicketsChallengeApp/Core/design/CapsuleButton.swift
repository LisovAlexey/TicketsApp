//
//  CapsuleButton.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 10/05/2023.
//

import SwiftUI


struct CapsuleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(Color(red: 0.7, green: 0.9, blue: 0.9))
            .clipShape(Capsule())
            .shadow(radius: 3)
    }
}
