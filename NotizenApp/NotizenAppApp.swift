//
//  NotizenAppApp.swift
//  NotizenApp
//
//  Created by Julian on 20/06/2024.
//

import SwiftUI

@main
struct NotizenAppApp: App {
    
    @StateObject private var dataController = DataController(name: "Model")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
