//
//  VisitorCount.swift
//  Experiments
//
//  Created by max tang on 17/4/5.
//  Copyright © 2017年 TaiLopez. All rights reserved.
//

import Foundation
import RealmSwift

class VisitorCount : Object {
    dynamic var date: Date = Date()
    dynamic var count: Int = Int(0)
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
