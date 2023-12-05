//
//  ViewController.swift
//  preWorkVignesh
//
//  Created by Vignesh Gunasekaran on 8/24/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        func changeColor() -> UIColor{

                let red = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue = CGFloat.random(in: 0...1)

                return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
            }
            
        
        let randomColor = changeColor()
        view.backgroundColor = randomColor
    }
    
    @IBAction func revertBackgroundColour(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var schoolNameTextField: UITextField!
    @IBOutlet var yearSegmentedControl: UISegmentedControl!
    @IBOutlet var numberOfPetsLabel: UILabel!
    @IBOutlet var morePetsStepper: UIStepper!
    @IBOutlet var morePetsSwitch: UISwitch!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        let yearDetails: [String: String] = [
            "UG 1": "Undergraduate first",
            "UG 2": "Undergraduate second",
            "UG 3": "Undergraduate third",
            "UG 4": "Undergraduate fourth",
            "GR 1": "Graduate first",
            "GR 2": "Graduate second"
        ]
        
        let numberOfPets = Int(numberOfPetsLabel.text ?? "0") ?? 0

        let petDescription = numberOfPets == 1 ? "dog" : "dogs"
        
        let trimmedFirstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let trimmedSchoolName = schoolNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

                
        let introduction = "My name is \(trimmedFirstName) \(lastNameTextField.text!) and I attend \(trimmedSchoolName).  \nI am currently in my \(yearDetails[year!] ?? "") year and I own \(numberOfPets) \(petDescription) 🐶. \(morePetsSwitch.isOn ? "I still want more pets" : "I don't want any more pets")."

        print(introduction)
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)

        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }
    
    
}

