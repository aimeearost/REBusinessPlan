//
//  StoredPropertiesTableViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 1/3/21.
//

import UIKit
import RealmSwift

class StoredPropertiesTableViewController: UITableViewController {
        
    
    var finalResult: String?
    var address: String?
    let realm = try! Realm()

    var allSales = try! Realm().objects(Sales.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        print(allSales.count)
        print("address is: " + allSales[allSales.count-1].address)
    }
    
    
//    func loadItems() {
//        propertyItems = items.sorted(byKeyPath: "address", ascending: true)
//        tableView.reloadData()
//    }

    // MARK: - Table view data source


//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
////        return itemArray.count
//        return salesItems?.count ?? 1
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//        if let item = salesItems?[indexPath.row] {
//            cell.textLabel?.text = item.address
//
//        } else {
//            cell.textLabel?.text = "No Items Added"
//        }
////        loadItems()
//        return cell
//
        
        
        
//        var textField = UITextField()
//        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//                 if let currentCategory = self.selectedCategory {
//                     do {
//                         try self.realm.write {
//                             let newItem = Sales()
//                            newItem.address = address ?? "what"
//                            newItem.finalResult = finalResult ?? "1"
//                             currentCategory.items.append(newItem)
//                         }
//                     } catch {
//                         print("Error saving new items, \(error)")
//                     }
//                 }
//                 self.tableView.reloadData()
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
//        return cell

//
//        if let item = propertyItems?[indexPath.row] {
//            cell.textLabel?.text = item.address
////            cell.accessoryType = item.done ? .checkmark : .none
//        } else {
//            cell.textLabel?.text = "No Items Added"
//        }

//    }
    
    // MARK: - Tableview Delegate Methods
    //Mark - TableView Delegate Methods
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        if let addressItem = propertyItems?[indexPath.row] {
//            do {
//                try realm.write{
//                     realm.delete(addressItem)
//                }
//            } catch {
//                print("Error saving done status, \(error)")
//            }
//        }
//
//        tableView.reloadData()
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
// MARK: - Tableview Delegate Method - detects which row was selected

// MARK: - Add new items


    

//    override func updateModel(at indexPath: IndexPath) {
//        if let item = propertyItems?[indexPath.row] {
//            do {
//                try realm.write{
//                    realm.delete(item)
//                }
//            } catch {
//                print("Error deleting item, \(error)")
//            }
//        }
//    }
// }
//    func loadCategories() {
//        selectedCategory = realm.objects(Category)
//    }
//
//    
//
    

}
