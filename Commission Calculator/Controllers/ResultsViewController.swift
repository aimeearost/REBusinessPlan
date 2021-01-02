//
//  ResultsViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 12/13/20.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var finalResultLabel: UILabel!
    
    var finalResult: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(finalResult ?? "$")
        finalResultLabel.text = finalResult
  
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)

        
    }
    
    @IBAction func storeResultsButton(_ sender: UIButton) {
        
        
    }
}
