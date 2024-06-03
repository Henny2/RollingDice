//
//  ContentView.swift
//  RollingDice
//
//  Created by Henrieke Baunack on 6/1/24.
//

import SwiftUI

// next steps:
// 1) make it use a class for DiceRoll so that you can add a list at the bototm, listing the last diceRolls
// 2) make it look better
// 3) think about what other things you want to implement
// 4) add reset function (functionalitY)

struct ContentView: View {
    @State private var showSettings = false
    @State private var diceRolls : [[Int]] = []
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
                        var rolledNums : [Int] = []
                        for _ in 1..<numDice+1 {
                            rolledNum = Int.random(in: 1..<numSidesOfDice)
                            rolledNums.append(rolledNum)
                        }
                        diceRolls.append(rolledNums)
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(width:200, height:200)
                    .background(.gray)
                    .clipShape(.circle)
                    .padding()
                    Text("Rolled Nums: \(diceRolls)")
                    
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
