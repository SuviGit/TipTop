//
//  TipTopApp.swift
//  TipTop
//
//  Created by Suvidha on 7/4/21.
//

import SwiftUI

@main
struct TipTopApp: App {
    
    //let tipTop = TipCalculator()
   
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TipCalculator())
        }
    }
}
