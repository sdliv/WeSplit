//
//  ContentView.swift
//  WeSplit
//
//  Created by Sean on 5/2/20.
//  Copyright © 2020 Sean. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkoutAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkoutAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text("$\(checkoutAmount)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
