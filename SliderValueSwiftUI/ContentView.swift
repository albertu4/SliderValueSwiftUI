//
//  ContentView.swift
//  SliderValueSwiftUI
//
//  Created by Михаил Иванов on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    let sliderValue = 30
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к : \(sliderValue)")
            
            HStack{
                Text("0")
                Spacer()
                Text("100")
            }
            
            ButtonView(text: "Проверь меня") {
                    
                }
            
            ButtonView(text: "Начать заново") {
                    
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
