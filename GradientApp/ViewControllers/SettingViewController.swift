//
//  ViewController.swift
//  GradientApp
//
//  Created by Artiom Poluyanovich on 28.03.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colourView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet var valueLabels: [UILabel]!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var rgbTextFields: [UITextField]!
    
    var delegate: SettingsViewControllerDelegate!
    var colour: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initScreen()
        addDoneButtonOnKeyboard()
    }
    
    @IBAction func rgbSlidersAction() {
        setupLableText()
        changeBackgroundColour()
        changeTextInTheTextField()
    }
    
    @IBAction func returnButtonPressed() {
        delegate.setColourForView(colour: colour)
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: Private Methods
extension SettingsViewController {
    private func changeBackgroundColour() {
        let colour = UIColor(cgColor: CGColor(red: CGFloat(redSlider.value),
                                              green: CGFloat(greenSlider.value),
                                              blue: CGFloat(blueSlider.value),
                                              alpha: 1.0))
        
        colourView.backgroundColor = colour
        self.colour = colour
    }
    
    private func setupLableText() {
        guard let valueLabels = self.valueLabels else { return }
        for valueLabel in valueLabels {
            switch valueLabel.tag {
            case 0:
                valueLabel.text = String(format: "%.2f", redSlider.value)
                continue
            case 1:
                valueLabel.text = String(format: "%.2f", greenSlider.value)
                continue
            default:
                valueLabel.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
    
    private func initScreen() {
        colourView.backgroundColor = colour
        redSlider.value = Float(colour.rgba.red)
        greenSlider.value = Float(colour.rgba.green)
        blueSlider.value = Float(colour.rgba.blue)
        setupLableText()
        changeTextInTheTextField()
    }
    
    private func changeTextInTheTextField() {
        guard let rgbTextFields = rgbTextFields else { return }
        for textField in rgbTextFields {
            switch textField.tag {
            case 0:
                textField.text = redValueLabel.text
                continue
            case 1:
                textField.text = greenValueLabel.text
                continue
            default:
                textField.text = blueValueLabel.text
            }
        }
    }
}

//MARK: // UIColor extension
extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}

//MARK: // Keyboard methods
extension SettingsViewController: UITextFieldDelegate  {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 4
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if let colour = Float(textField.text ?? "0.00")   {
//            switch textField.tag {
//            case 0:
//                redSlider.value = colour
//            case 1:
//                greenSlider.value = colour
//            default:
//                blueSlider.value = colour
//            }
//            setupLableText()
//            changeBackgroundColour()
//        }
//        textField.resignFirstResponder()
//        return true
//    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar = UIToolbar()
        doneToolbar.sizeToFit()
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        doneToolbar.items = [done]
        
        guard let rgbTextFields = rgbTextFields else { return }
        for textField in rgbTextFields {
            switch textField.tag {
            case 0:
                textField.inputAccessoryView = doneToolbar
                continue
            case 1:
                textField.inputAccessoryView = doneToolbar
                continue
            default:
                textField.inputAccessoryView = doneToolbar
            }
        }
        
    }
    
    @objc func doneButtonAction() {
        guard let rgbTextFields = rgbTextFields else { return }
        for textField in rgbTextFields {
            if let colour = Float(textField.text ?? "0.00") {
                switch textField.tag {
                case 0:
                    redSlider.value = colour
                case 1:
                    greenSlider.value = colour
                default:
                    blueSlider.value = colour
                }
                setupLableText()
                changeBackgroundColour()
            }
            view.endEditing(true)
        }
        
    }
}


