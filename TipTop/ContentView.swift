//
//  ContentView.swift
//  TipTop
//
//  Created by Suvidha on 7/4/21.
//

import SwiftUI

struct ContentView: View {
    
   @EnvironmentObject var viewModel:TipCalculator
    
    var body: some View {
            
        
        ZStack{
            Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            HStack{
                //ForEach (viewModel.tipCards,content:{card in
                   // TipCardView(card: card)
                    VStack{
                        
                        TextView(textfield: $viewModel.totalAmount)
                        
                        HStack{
                            
                            TipCardView(card: viewModel.tipCards[0], billTip: viewModel.tipCards[0].totalTip)
                                .padding(.leading,40)
                                Spacer()
                    
                            TipCardView(card: viewModel.tipCards[1], billTip: viewModel.tipCards[1].totalTip)
                                .padding(.trailing,40)
                        }
                        
                        .padding(.vertical,2)
                        
                        HStack{
                            TipCardView(card: viewModel.tipCards[2], billTip: viewModel.tipCards[2].totalTip)
                                .padding(.leading,40)
                                Spacer()
                    
                            TipCardView(card: viewModel.tipCards[3], billTip: viewModel.tipCards[3].totalTip)
                                .padding(.trailing,40)
                        }
                        .padding(.vertical,2)
                        HStack{
                            TipCardView(card: viewModel.tipCards[4], billTip: viewModel.tipCards[4].totalTip)
                        }
                        
                    }
               // })
            }
        }
    }
}

struct TipCardView: View{
    
   let card:TipCard.CardModel
   let billTip:String
   
    var body: some View{
            
        HStack{
           
            VStack{
                Text(String(self.card.percentage)+"%")
                    .font(.system(size: 20, weight: .heavy, design: .serif))
                    .frame(width: 50, height: 50, alignment: .center)
                
                Text(billTip)//(self.card.totalTip)
                    .font(.system(size: 20, weight: .heavy, design: .serif))
                    .frame(width: 50, height: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                    
            }
        }
        .frame(width: 150, height: 150)
        .blendMode(.hardLight)
        .background(self.card.color)
        .clipShape(Circle())
        //.clipShape(RoundedRectangle.init(cornerRadius: 20, style: .continuous))
        .shadow(color: self.card.color, radius: 10, x: 0.0, y: 10.0)
        
    }
  
    
}

struct TextView : View{
    
    @Binding var textfield:String
    @EnvironmentObject var env:TipCalculator
    
    var body: some View{
        
        HStack{
            TextField("Enter the amount", text: $textfield)
                .onChange(of: textfield){ text in
                    print("Text Edited....,\(textfield) ")
                    env.updateTip()
                }
                .frame(height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                .clipShape(RoundedRectangle.init(cornerRadius: 20, style: .continuous))
                .keyboardType(.decimalPad)
                .font(.system(size: 21, weight: .bold, design: .serif))
                
                
                
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TipCalculator())
    }
}
