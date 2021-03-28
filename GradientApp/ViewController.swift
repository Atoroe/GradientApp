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
    
    private var viewColour = CGColor(red: 1.0,
                                     green: 1.0,
                                     blue: 1.0,
                                     alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliders()
        changeBackgroundColour()
    }

    @IBAction func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        changeBackgroundColour()
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        changeBackgroundColour()
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        changeBackgroundColour()
    }
    
    private func setupSliders() {
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        redSlider.value = 0.25
        redSlider.tintColor = .red
        
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        greenSlider.value = 0.5
        greenSlider.tintColor = .green
        
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        blueSlider.value = 0.75
        blueSlider.tintColor = .blue
    }
    
    private func changeBackgroundColour() {
        viewColour = CGColor(red: CGFloat(redSlider.value),
                             green: CGFloat(greenSlider.value),
                             blue: CGFloat(blueSlider.value),
                             alpha: 1.0)
        colourView.backgroundColor = UIColor(cgColor: viewColour)
    }
}

