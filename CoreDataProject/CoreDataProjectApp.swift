//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Sergey Dolgikh on 28.12.2021.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            PredicateView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
