//
//  CrewScrollView.swift
//  PR8_ Moonshot
//
//  Created by user09 on 13.02.2024.
//

import SwiftUI

struct CrewScrollView: View {
    let currentCrew: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(currentCrew, id: \.role) { crewMember in
                    NavigationLink(value: AstronaughtView(astronaught: crewMember.astronaut)) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationDestination(for: AstronaughtView.self) { astronaut in
                AstronaughtView(astronaught: astronaut.astronaught)
            }
        }
    }
}
