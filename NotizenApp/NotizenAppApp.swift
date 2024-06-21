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
    @State private var filter = ""
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView(filter: filter)
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                TextField("Filter", text: $filter).padding(.horizontal)
            }
            
        }
    }
}
