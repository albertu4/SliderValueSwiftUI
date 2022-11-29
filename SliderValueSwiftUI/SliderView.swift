//
//  SliderView.swift
//  SliderValueSwiftUI
//
//  Created by Михаил Иванов on 01.06.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var currentValue: Int
    let alphaValue: Int
    
//MARK: - Slider View
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alphaValue)/100)
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

//MARK: - Coordinator
extension SliderView {
    class Coordinator: NSObject {
        
        @Binding var currentValue: Int
        
        init(currentValue: Binding<Int>) {
            self._currentValue = currentValue
        }
        
        @objc func changeSliderValue(_ sender: UISlider) {
            currentValue = Int(sender.value)
        }
    }
}

//MARK: - Preview
struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50), alphaValue: 50)
    }
}
