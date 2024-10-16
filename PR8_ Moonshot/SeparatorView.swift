//
//  SeparatorView.swift
//  PR8_ Moonshot
//
//  Created by user09 on 13.02.2024.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    SeparatorView()
}
