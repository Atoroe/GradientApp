//
//  ViewController.swift
//  GradientApp
//
//  Created by Artiom Poluyanovich on 28.03.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colourView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeBackgroundColour()
        setupLableText()
    }
    
    @IBAction func redSliderAction() {
        setupLableText()
        changeBackgroundColour()
    }
    
    @IBAction func greenSliderAction() {
        setupLableText()
        changeBackgroundColour()
    }
    
    @IBAction func blueSliderAction() {
        setupLableText()
        changeBackgroundColour()
    }
    
    private func changeBackgroundColour() {
        colourView.backgroundColor = UIColor(cgColor: CGColor(red:                                                              CGFloat(redSlider.value),
                                                              green: CGFloat(greenSlider.value),
                                                              blue: CGFloat(blueSlider.value),
                                                              alpha: 1.0))
    }
    
    private func setupLableText() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}

