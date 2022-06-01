//
//  SliderView.swift
//  SliderValueSwiftUI
//
//  Created by Михаил Иванов on 01.06.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    let targetValue: Int
    let currentValue: Float
    @Binding var result: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        setSliderConfigure(slider)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(result: $result)
    }
    
    private func setSliderConfigure(_ slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = currentValue
        slider.thumbTintColor = .red
    }
    
    
    
    func computeScore(slider: UISlider) -> Int {
        let difference = abs(targetValue - lround(Double(slider.value)))
        return (100 - difference)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var result: Int
        
        init(result: Binding<Int>) {
            self._result = result
        }
        
        @objc func changeSliderValue(_ sender: UISlider) {
//            result = SliderView.computeScore(slider: sender)
            
            sender.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(result/100))
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(targetValue: 40, currentValue: 30, result: .constant(40))
    }
}
