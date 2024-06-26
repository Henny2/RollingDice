//
//  SettingsView.swift
//  RollingDice
//
//  Created by Henrieke Baunack on 6/2/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    let diceTypes = [6, 8, 12, 20, 100]
    let numDice = [1, 2, 3, 4, 5, 6]
    @Binding var numSidesOfDice : Int
    @Binding var selectedNumDice : Int
    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack{
            Spacer()
            Button("Close"){
                dismiss()
            }
        }.padding([.horizontal, .top])
        VStack{
            Text("How do you want to roll your dice??")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer() // pushing text to the top
            
            Text("How many sides for your dice?").font(.title2)
            Picker("Select a dice", selection: $numSidesOfDice){
                ForEach(diceTypes, id:\.self){
                    Text("\($0)")
                }
            }
            .pickerStyle(.inline)
            Spacer()
            Text("How many dice?").font(.title2)
            Picker("Select a dice", selection: $selectedNumDice){
                ForEach(numDice, id:\.self){
                    Text("\($0)")
                }
            }
            .pickerStyle(.inline)
            Spacer()
        }
    }
}

#Preview {
    struct Preview: View {
        @State var number = 10
        @State var booleanVal = false
        @State var numberDice = 2
        var body: some View {
            SettingsView(isPresented: $booleanVal, numSidesOfDice: $number, selectedNumDice: $numberDice)
        }
    }
    return Preview()
}
