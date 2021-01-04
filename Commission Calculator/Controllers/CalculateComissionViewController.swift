//
//  ViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 12/13/20.
//

import UIKit
import RealmSwift

class CalculateCommissionViewController: UIViewController {
    
    
    @IBOutlet weak var homeValueResult: UILabel!
    @IBOutlet weak var referralFeesResult: UILabel!
    @IBOutlet weak var commissionResult: UILabel!
    @IBOutlet weak var splitResult: UILabel!
    @IBOutlet weak var businessFeeResult: UILabel!
        
    
    var homeValueNumber = 0
    var referralFee: Double? = 1.00
    var result = 1
    var commission = 1.00
    var split = 80.00
    var businessFee = 4.00
    var resultAsInt = 1000000
    var finalResult = "$"
    var address = "it's a mystery"
    let realm = try! Realm()
    var sales = Sales()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var allSales = realm.objects(Sales.self)
        print(allSales.count)

        
    }
    
    @IBAction func salesPrice(_ sender: UITextField) {
            let value = sender.text
            homeValueNumber = Int(value!) ?? 0
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:homeValueNumber))
            homeValueResult.text = "$" + String(formattedNumber!)
        }
        
    
    @IBAction func homeAddressInput(_ sender: UITextField) {
        let homeAddress = sender.text
        address = homeAddress ?? "No Address Provided"
    }
    
    

    @IBAction func referralFeeInput(_ sender: UITextField) {
        
        let referralFeeInput = sender.text
        referralFee = Double(referralFeeInput ?? "") ?? 0.00
        if referralFee == 0.00 {
            referralFeesResult.text = "no referral fee"
        } else {
            referralFeesResult.text = String(format: "%.1f", referralFee!) + "%"
            referralFee = (100 - (Double(referralFee!))) / 100
        }
        print(referralFee)
    }
    
 
    @IBAction func commissionInput(_ sender: UITextField) {
        let commissionInput = sender.text
        commission = Double(commissionInput!) ?? 3.00
        commissionResult.text = String(format: "%.2f", commission) + "%"
        commission = (Double(commissionInput!) ?? 1.00) / 100
        
    }
    
    @IBAction func splitInput(_ sender: UITextField) {
        let splitInput = sender.text
        split = Double(splitInput!) ?? 80.00
        splitResult.text = String(format: "%.1f", split) + "%"
        split = (Double(splitInput!) ?? 1.00) / 100
    
    }
    
    
    @IBAction func businessFeeInput(_ sender: UITextField) {
        let businessFeeInput = sender.text
        businessFee = Double(businessFeeInput!) ?? 4.00
        businessFeeResult.text = String(format: "%.1f", businessFee) + "%"
        businessFee = (Double(businessFeeInput!) ?? 4.00) / 100
    }
    
    @IBAction func calculateCommision(_ sender: UIButton) {
        
        if referralFee == 0.00 {
        result = Int(Double(homeValueNumber) * commission * split - businessFee)
        } else {
        result = Int(Double(homeValueNumber) * commission * split * referralFee! - businessFee)

        }
        
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
            destinationVC.address = address
            
            
            let newSale = Sales()
            newSale.address = address
            newSale.finalResult = finalResult
            self.save(sale: newSale)
            
            print(newSale.address)
            print(newSale.finalResult)
            print(newSale)
            
        } else {
            
        }
    }
    
    //Mark: - Data Manipulation Methods
    func save(sale: Sales) {
        do {
            try realm.write {
                realm.add(sale)
            }
        } catch {
            print("Error saving sale \(error)")
        }
    }
    
}




