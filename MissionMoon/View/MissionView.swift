//
//  MissionView.swift
//  MissionMoon
//
//  Created by Mete Alp Kizilcay on 25.10.2020.
// All textual and visual content taken from Wikipedia.

import SwiftUI

struct MissionView: View {
    
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader {
            geometry in
            ScrollView(.vertical){
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.8)
                        .padding(.top)
                    Text("Launch Date: \(self.mission.formattedLaunchDate)")
                        
                    Text(self.mission.description)
                        .padding()
                    ForEach(self.astronauts, id: \.role) {
                        crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle()
                                                .stroke(Color.primary, lineWidth: 1))
                                VStack(alignment: .leading, content: {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary )
                                })
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName),
                            displayMode: .inline)
    }
    
    init(mission: Mission) {
        self.mission = mission
        self.astronauts = mission.crewMembers
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
//    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[0])
    }
}
