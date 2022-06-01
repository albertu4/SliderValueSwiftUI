//
//  ContentView.swift
//  SliderValueSwiftUI
//
//  Created by Михаил Иванов on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = 50
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var result = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к : \(targetValue)")
            
            HStack{
                Text("0")
                SliderView(targetValue: targetValue, currentValue: currentValue, result: $result)
                Text("100")
            }
            
            ButtonView(text: "Проверь меня") {
                showAlert.toggle()
            }
            .alert("Your score",
                   isPresented: $showAlert,
                   actions: {}) {
                Text("\(result)")
            }
            
            ButtonView(text: "Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 50
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
