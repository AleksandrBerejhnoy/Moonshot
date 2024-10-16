//
//  AstronaughtView.swift
//  PR8_ Moonshot
//
//  Created by user09 on 10.02.2024.
//

import SwiftUI

struct AstronaughtView: View, Hashable {
    let astronaught: Astronaut
    
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaught.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaught.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaught.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronaughts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronaughtView(astronaught: astronaughts["aldrin"]!)
        .preferredColorScheme(.dark)
}
