//
//  TicketDetailsView.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 11/05/2023.
//

import SwiftUI

import CoreImage.CIFilterBuiltins


struct TicketDetailsView: View {
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    
    
    var ticket: EventTicket
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Purchase date/time")
                    .font(.title2)
                Spacer()
                Text(ticket.date.formatAsDateAndTime)
                    .font(.title)
                    .bold()
            }
            
            
            
            Image(uiImage: generateQRCode(from: ticket.qrCodeEncoding))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                
        }.fixedSize()
        .padding(20)
    }
}

struct TicketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetailsView(ticket: EventTicket.mock)
    }
}
