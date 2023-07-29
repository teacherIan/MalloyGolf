//
//  MalloyGolfApp.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/7/20.
//

import SwiftUI

@main
struct MalloyGolfApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
