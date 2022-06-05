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
        setSliderConfigure(slider)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(alphaValue)/100)
    }
    
//MARK: - Slider properties
    private func setSliderConfigure(_ slider: UISlider) {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(alphaValue)/100)
    }
}

//MARK: - Coordinator
extension SliderView {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
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
