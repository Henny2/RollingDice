//
//  ContentView.swift
//  RollingDice
//
//  Created by Henrieke Baunack on 6/1/24.
//

import SwiftUI

// potential upgrades:
// 1) add swift data storage?

struct ContentView: View {
    @State private var showSettings = false
    @State private var diceRolls : [DiceRoll] = []
//    @State private var diceRolls : [[Int]] = []

    let diceTypes = [6, 8, 12, 20, 100]
    @State private var rolledNum = 0
    // number of sides on the die
    @State private var numSidesOfDice = 6 // default six sides
    @State private var numDice = 1
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading) {
                    Text("Rolling \(numDice) dice.")
                        .font(.headline)
                    Text("Each dice has \(numSidesOfDice) sides.")
                        .font(.headline)
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      alignment: .topLeading
                    )
                Spacer()
                VStack(alignment: .center){
                    Button("Roll dice"){
//                        var rolledNums : [Int] = []
                        let diceRoll = DiceRoll()
                        for _ in 1..<numDice+1 {
                            rolledNum = Int.random(in: 1..<numSidesOfDice)
//                            rolledNums.append(rolledNum)
                            diceRoll.numbers.append(rolledNum)
                        }
//                        diceRolls.append(rolledNums)
                        diceRolls.append(diceRoll)
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width:200, height:200)
                    .background(.gray)
                    .clipShape(.circle)
                    .padding()
//                    Text("Rolled Nums: \(diceRolls)")
                    Text("Dice Rolls").font(.title3).bold()
                    List(diceRolls){ diceRoll in
                        Text("\(diceRoll.numbers)")
                    }
                    
                }
                Spacer()
                Spacer()
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(isPresented: $showSettings, numSidesOfDice: $numSidesOfDice, selectedNumDice: $numDice)
            }
            .navigationTitle("Rolling dice!")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Reset"){
                        print("Reset")
                        reset()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Settings"){
                        showSettings = true
                    }
                }
            }
            
//            .background(.red)
            .padding()
        }
    }
    func reset() {
        diceRolls = []
        numSidesOfDice = 6
        numDice = 1
    }
}

#Preview {
    ContentView()
}
