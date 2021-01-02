//
//  ViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 12/13/20.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var homeValueResult: UILabel!
    @IBOutlet weak var commissionResult: UILabel!
    @IBOutlet weak var splitResult: UILabel!
    @IBOutlet weak var businessFeeResult: UILabel!
    
    var homeValueNumber = 0
    var result = 1
    var commission = 1.00
    var split = 80.00
    var businessFee = 4.00
    var resultAsInt = 1000000
    var finalResult = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func homeValueButton(_ sender: UIButton) {
        
        
        showInputDialog(title: "Home value",
                        subtitle: "Please enter home value.",
                        actionTitle: "Add",
                        cancelTitle: "Cancel",
                        inputPlaceholder: "Home value",
                        inputKeyboardType: .numberPad, actionHandler:
                            { (input:String?) in
                                print("The new number is \(input ?? "")")
                                self.homeValueNumber = Int(input!) ?? 2
                                let numberFormatter = NumberFormatter()
                                numberFormatter.numberStyle = .decimal
                                let formattedNumber = numberFormatter.string(from: NSNumber(value:self.homeValueNumber))
                                self.homeValueResult.text = "$" + String(formattedNumber!)
                                
                            })
    }
    
    @IBAction func commissionButton(_ sender: UIButton) {
        showInputDialog(title: "Your commission",
                        subtitle: "Please enter the commission on this transaction.",
                        actionTitle: "Add",
                        cancelTitle: "Cancel",
                        inputPlaceholder: "Commission",
                        inputKeyboardType: .numberPad, actionHandler:
                            { (input:String?) in
                                print("The new number is \(input ?? "")")
                                self.commission = Double(input!) ?? 2.00
                                self.commissionResult.text = String(format: "%.2f", self.commission) + "%"
                                self.commission = (Double(input!) ?? 1.00) / 100
                                print(self.commission)
                            })
    }
    
    
    @IBAction func splitButton(_ sender: UIButton) {
        showInputDialog(title: "Your split",
                        subtitle: "Please enter your split on this transaction.",
                        actionTitle: "Add",
                        cancelTitle: "Cancel",
                        inputPlaceholder: "Split",
                        inputKeyboardType: .numberPad, actionHandler:
                            { (input:String?) in
                                print("The new number is \(input ?? "")")
                                self.split = Double(input!) ?? 2.00
                                self.splitResult.text = String(format: "%.1f", self.split) + "%"
                                self.split = (Double(input!) ?? 1.00) / 100
                                print(self.split)
                            })
    }
    
    
    @IBAction func businessFeeButton(_ sender: UIButton) {
        showInputDialog(title: "Business Fee Percentage",
                        subtitle: "Your business fee percent on this transaction.",
                        actionTitle: "Add",
                        cancelTitle: "Cancel",
                        inputPlaceholder: "Split",
                        inputKeyboardType: .numberPad, actionHandler:
                            { (input:String?) in
                                print("The new number is \(input ?? "")")
                                self.businessFee = Double(input!) ?? 4.00
                                self.businessFeeResult.text = String(format: "%.1f", self.businessFee) + "%"
                                self.businessFee = (Double(input!) ?? 4.00) / 100
                                print(self.split)
                            })
    }
    
    
    @IBAction func calculateCommision(_ sender: UIButton) {
        
        result = Int(Double(homeValueNumber) * commission * split - businessFee)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:result))
        
        finalResult = "$" + String(formattedNumber!)
        print(finalResult)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalResult = finalResult
            
        } else {
            
        }
    }
}


extension UIViewController {
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
            
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.present(alert, animated: true, completion: nil)
    }
}

