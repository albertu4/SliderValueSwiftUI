//
//  ViewController.swift
//  SliderViewController
//
//  Created by Михаил Иванов on 01.06.2022.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    private let targetValue = Int.random(in: 0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setValue(50, animated: false)
    }

    @IBAction func changeSliderValue(_ sender: UISlider) {
        slider.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: computeScore())
    }
    
    private func computeScore() -> CGFloat {
        let difference = abs(targetValue - lround(Double(slider.value)))
        return CGFloat(100 - difference)/100
    }
}

