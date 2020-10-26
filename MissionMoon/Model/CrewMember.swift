//
//  CrewMember.swift
//  MissionMoon
//
//  Created by Mete Alp Kizilcay on 25.10.2020.
//

import Foundation

struct CrewMember: Identifiable {
    var id = UUID()
    let role: String
    let astronaut: Astronaut
}
