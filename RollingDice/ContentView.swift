//
//  ContentView.swift
//  RollingDice
//
//  Created by Henrieke Baunack on 6/1/24.
//

import SwiftUI

// next steps:
// 1) add number of dice selector
// 2) make it look better
// 3) think about what other things you want to implement

struct ContentView: View {
    @State private var showSettings = false
    @State private var diceRolls = []
    let diceTypes = [6, 8, 12, 20, 100]
    @State private var rolledNum = 0
    // number of sides on the die
    @State private var numSidesOfDice = 12 // default six sides
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Text("Select a dice type!")
                    Picker("Select a dice", selection: $numSidesOfDice){
                        ForEach(diceTypes, id:\.self){
                            Text("\($0)")
                        }
                    }
                }
                Button("Roll dice"){
                    rolledNum = Int.random(in: 1..<numSidesOfDice)
                    diceRolls.append(rolledNum)
                }
                if(rolledNum > 0){
                    Text("Rolled Number: \(rolledNum)")
                }
                Text("Rolled Nums: \(diceRolls)")
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(isPresented: $showSettings, numSidesOfDice: $numSidesOfDice)
            }
            .navigationTitle("Rolling dice!")
            .toolbar{
                Button("Settings"){
                    showSettings = true
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
