//
//  Mission.swift
//  MissionMoon
//
//  Created by Mete Alp Kizilcay on 25.10.2020.
//

import Foundation

let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

struct Mission: Codable, Identifiable {

    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var crewMembers: [CrewMember] {
        var matches = [CrewMember]()

        for member in crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        return matches
    }
}
