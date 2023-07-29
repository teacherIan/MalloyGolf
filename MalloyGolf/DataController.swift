//
//  DataController.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/21.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    var container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores {_,_ in
            print("Data loaded")
        }
    }
}
