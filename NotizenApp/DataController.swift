//
//  DataController.swift
//  NotizenApp
//
//  Created by Julian on 21/06/2024.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    var container: NSPersistentContainer
    init(name: String) {
        container = NSPersistentContainer(name: name)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("CoreData Error: \(error.localizedDescription)")
            }
        }
    }
}
