//
//  TextCard.swift
//  FriendFace
//
//  Created by Eugene on 04/09/2023.
//

import Foundation
import SwiftUI

struct TextCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.all], 8)
            .font(.body)
            .background(.white)
            .cornerRadius(10)
    }
}

extension View {
    func textCardStyle() -> some View {
        modifier(TextCard())
    }
}
