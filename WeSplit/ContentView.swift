//
//  ContentView.swift
//  WeSplit
//
//  Created by Sean on 5/2/20.
//  Copyright © 2020 Sean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // prperties with state observed
    @State private var checkoutAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var userRedText = false

    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkoutAmount) ?? 0
            
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkoutAmount)
                        .keyboardType(.decimalPad)
                        .foregroundColor(tipPercentage == 4 ? .red : .black)
                    // Picker with style determined by Apple, no 'pickerStyle'
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                // Section with a header
                Section(header: Text("How much tip do you want to leave?")) {
                    // Picker with segmented control picker style
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    // total per person with two decimal place limit
                    Text("$\(totalPerPerson, specifier: "%.2F")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
