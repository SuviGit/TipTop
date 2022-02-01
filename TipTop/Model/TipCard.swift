//
//  TipCard.swift
//  TipTop
//
//  Created by Suvidha on 7/4/21.
//

import SwiftUI

struct TipCard{
    
    var cards:Array<CardModel>


    init(numberOfCards:Int, cardColor:(Int) -> Color, cardPercentage:(Int) -> Int){
       cards = Array<CardModel>()
        
        for index in 0..<numberOfCards {
            
            let content = cardColor(index)
            let percent = cardPercentage(index)
            
            cards.append(CardModel(id: index, color: content, percentage: percent, totalTip: ""))
        }
    }
    
    mutating func updateTipInCard(bill: String){

        let billTipAmount = bill
        print(billTipAmount)
        
        if(Int(billTipAmount) != nil){
            for i in 0..<self.cards.count{
                self.cards[i].totalTip = String((Int(billTipAmount)! * (self.cards[i].percentage)/100))
                
            }
        }
        else{
            for i in 0..<self.cards.count{
                self.cards[i].totalTip = "0"
            }
        }
        
        
    }
    
    struct CardModel:Identifiable{
        
        var id:Int
        var color:Color
        var percentage:Int
        var totalTip:String
    }
    
   
    
}
