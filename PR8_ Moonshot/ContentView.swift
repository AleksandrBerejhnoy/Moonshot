//
//  ContentView.swift
//  PR8_ Moonshot
//
//  Created by user09 on 20.12.2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingGrid = true
                    }, label: {
                        Image(systemName: "circle.grid.2x2.fill")
                    })
                }
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingGrid = false
                    }, label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    })
                }
            }
        }
    }
}

struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums) {
                ForEach(missions) { mission in
                    NavigationLink(value: MissionView(misson: mission, astronaughts: astronauts)) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationDestination(for: MissionView.self) { missionView in
                MissionView(misson: missionView.misson, astronaughts: astronauts)
            }
        }
    }
}

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView() {
            ForEach(missions) { mission in
                NavigationLink(value: MissionView(misson: mission, astronaughts: astronauts)) {
                    LazyVStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
                .listRowBackground(Color.darkBackground)
            }
            .navigationDestination(for: MissionView.self) { missionView in
                MissionView(misson: missionView.misson, astronaughts: astronauts)
            }
        }
    }
}

#Preview {
    ContentView()
}
