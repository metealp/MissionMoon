//
//  Astronaut.swift
//  MissionMoon
//
//  Created by Mete Alp Kizilcay on 25.10.2020.
//

import Foundation
let missions: [Mission] = Bundle.main.decode("missions.json")

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
//    var assignedMissions: [Mission] {
//        var matches = [Mission]()
//        for mission in missions{
//            
//        }
//        for member in crew {
//            if let match = astronauts.first(where: { $0.id == member.name }) {
//                matches.append(CrewMember(role: member.role, astronaut: match))
//            } else {
//                fatalError("Missing \(member)")
//            }
//        }
//
//        return matches
//    }
}
