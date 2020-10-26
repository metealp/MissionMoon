//
//  ContentView.swift
//  MissionMoon
//
//  Created by Mete Alp Kizilcay on 25.10.2020.
//

import SwiftUI

struct ContentView: View {
//    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingCrew = false
    var body: some View {
        NavigationView {
            List(missions) {
                mission in

                
                NavigationLink(
                    destination: MissionView(mission: mission)){
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    if showingCrew {
                        VStack (alignment: .leading){
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                        }
                    } else {
                        HStack{
                            Text(mission.displayName)
                                .font(.headline)
                            VStack(alignment: .leading){
                                ForEach(mission.crewMembers){ ast in
                                    Text("\(ast.astronaut.name)")
                                        .font(.footnote)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: Button("Show \(showingCrew ? "Crew" : "Launch Date" )"){
                showingCrew.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
