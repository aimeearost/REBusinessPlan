//
//  SelectViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 1/2/21.
//

import UIKit
import RealmSwift

class SelectViewController: UIViewController {
    
   
    
    @IBAction func goToWhyButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWhy", sender: self)

    }
    
    @IBAction func goToCalculateCommissionButton(_ sender: UIButton) {
        
       
        
        
        performSegue(withIdentifier: "goToCalculateCommissionPage", sender: self)
    }
    
    @IBAction func goToTesting123(_ sender: UIButton) {
        performSegue(withIdentifier: "testing123", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "goToCalculateCommissionPage" {
            _ = segue.destination as! CalculateCommissionViewController
        } else {
//            _ = segue.destination as! WhyViewController
                        _ = segue.destination as! WhyViewController

        }
}
}
