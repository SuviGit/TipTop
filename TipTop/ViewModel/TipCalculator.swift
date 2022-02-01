//
//  TipCalculator.swift
//  TipTop
//
//  Created by Suvidha on 7/4/21.
//

import Foundation
import SwiftUI
import Combine

class TipCalculator:ObservableObject{
    
 
    //var didChange = PassthroughSubject<Void, Never>()
    
   @Published var totalAmount:String = ""//{didSet {didChange.send()}}
    
    
    private static var cardColors: Array<Color> = [Color(#colorLiteral(red: 1, green: 0.3110448622, blue: 0.6946177174, alpha: 0.6530728372)),Color(#colorLiteral(red: 1, green: 0.4482160801, blue: 0.22283594, alpha: 0.6589531299)), Color(#colorLiteral(red: 0.3114153242, green: 1, blue: 0.5237349155, alpha: 0.6635357181)),Color(#colorLiteral(red: 0.1830738315, green: 0.5159125394, blue: 1, alpha: 0.6614798236)),Color(#colorLiteral(red: 0.6591833542, green: 0.03970494446, blue: 0.9386639238, alpha: 0.7389246454))]
    
    private static var cardPercentages: Array<Int> = [10,12,15,18,20]
    
   @Published private var tipCardModel = TipCard(numberOfCards: 5){ pairIndex in
        
        TipCalculator.cardColors[pairIndex]
        
    } cardPercentage: { pairIndex in
        TipCalculator.cardPercentages[pairIndex]
    }
 
     var tipCards: Array<TipCard.CardModel>{
        tipCardModel.cards
    }
  
//    let bindedTipAmount = Binding<String>(
//        get:{
//            ""
//        },
//        set:{
//            totalAmount = $0
//            if(Int(totalAmount) != nil)
//                {
//                for i in 0..<self.tipCardModel.cards.count{
//                    self.tipCardModel.cards[i].totalTip = String(Int(totalAmount)! * (self.tipCardModel.cards[i].percentage/100))
//                }
//            }
//        }
//    )
    
    
   // Mark - INTENTS
    
    func updateTip(){
        tipCardModel.updateTipInCard(bill: totalAmount)
    }
}
