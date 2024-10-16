//
//  MissionView.swift
//  PR8_ Moonshot
//
//  Created by user09 on 10.02.2024.
//

import SwiftUI

struct MissionView: View, Hashable {
    
    let misson: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(misson.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, asix in
                        width * 0.6
                    }
                
                Text(misson.formattedMissionViewLaunchDate)
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.5))
                    .padding()
                
                VStack(alignment: .leading, content: {
                    
                    SeparatorView()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(misson.description)
                    
                    SeparatorView()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                })
                .padding(.horizontal)
                
                CrewScrollView(currentCrew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(misson.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(misson: Mission, astronaughts: [String: Astronaut]) {
        self.misson = misson
        self.crew = misson.crew.map { member in
            if let astronaught = astronaughts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaught)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astrounaughts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(misson: missions[0], astronaughts: astrounaughts)
        .preferredColorScheme(.dark)
}
