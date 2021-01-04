//
//  Data.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 1/2/21.
//

import Foundation
import RealmSwift

class Sales: Object {
    @objc dynamic var address: String = ""
    @objc dynamic var finalResult: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var result: Int = 1
}
