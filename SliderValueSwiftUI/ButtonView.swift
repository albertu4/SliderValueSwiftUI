//
//  ButtonView.swift
//  SliderValueSwiftUI
//
//  Created by Михаил Иванов on 01.06.2022.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button("\(text)") {
            action()
        }
        .foregroundColor(.blue)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Начать заново") {
        }
    }
}
