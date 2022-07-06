//
//  CardView.swift
//  CheckInsPerformance
//
//  Created by Firat Özsarıkamış on 6.07.2022.
//

import SwiftUI

struct Card: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color(UIColor.black), radius: 15, x: 0, y: 5)
    }
}

extension View {
    func card() -> some View {
        modifier(Card())
    }
}
