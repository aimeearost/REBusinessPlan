//
//  ResultsViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 12/13/20.
//

import UIKit
import RealmSwift


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var finalResultLabel: UILabel!
    @IBOutlet weak var homeAddressLabel: UILabel!
    
    var finalResult: String?
    var address: String?
    

    override func viewDidLoad() {

        super.viewDidLoad()
        finalResultLabel.text = finalResult
        homeAddressLabel.text = ("\(address ?? "it's a mystery") is")
    }
    
 

    
    @IBAction func storeResultsButton(_ sender: UIButton) {
//        var textField = UITextField()
        self.performSegue(withIdentifier: "goToStoredPropertyData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToStoredPropertyData" {
            let destinationVC = segue.destination as! StoredPropertiesTableViewController
            destinationVC.finalResult = finalResult
            destinationVC.address = address
            
        } else {
            
        }
    }
}
