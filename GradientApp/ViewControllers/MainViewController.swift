//
//  MainViewController.swift
//  GradientApp
//
//  Created by Artiom Poluyanovich on 11.04.21.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColourForView(colour: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colour = view.backgroundColor
        settingsVC.delegate = self
    }

}

extension MainViewController: SettingsViewControllerDelegate {
    func setColourForView(colour: UIColor) {
        view.backgroundColor = colour
    }
}
