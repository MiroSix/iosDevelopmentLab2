//
//  NumberButtonView.swift
//  RPNCalculator
//
//  Created by Miro Six on 16/10/2025.
//

import SwiftUI

struct NumberButtonView: View {
    let number: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("\(number)")
                .font(.body)
                .fontWeight(.semibold)
                .padding(.vertical, 6)
                .padding(.horizontal, 10)
        }
        .buttonStyle(.plain)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.black)
        )
        .foregroundStyle(Color.white)
    }
}

#Preview {
    VStack() {
        NumberButtonView(number: 6, action: {})
        NumberButtonView(number: 7, action: {})
    }
}

