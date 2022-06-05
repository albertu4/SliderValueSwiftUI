//
//  ContentView.swift
//  SliderValueSwiftUI
//
//  Created by Михаил Иванов on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50
    @State private var targetValue = Int.random(in: 0...100)
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к : \(targetValue)")
            
            HStack{
                Text("0")
                
                SliderView(
                    currentValue: $currentValue,
                    alphaValue: computeScore()
                )
                
                Text("100")
            }
            
            ButtonView(text: "Проверь меня") {
                showAlert.toggle()
            }
            .alert("Your score",
                   isPresented: $showAlert,
                   actions: {}) {
                Text("\(computeScore())")
            }.padding()
            
            ButtonView(text: "Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
