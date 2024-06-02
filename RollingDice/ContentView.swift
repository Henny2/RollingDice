//
//  ContentView.swift
//  RollingDice
//
//  Created by Henrieke Baunack on 6/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var diceRolls = []
    let diceTypes = [6, 8, 12, 20, 100]
    @State private var rolledNum = 0
    // number of sides on the die
    @State private var numSidesOfDice = 6 // default six sides
    var body: some View {
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
        .padding()
    }
}

#Preview {
    ContentView()
}
