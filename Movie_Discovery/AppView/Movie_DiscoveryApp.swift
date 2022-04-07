//
//  Movie_DiscoveryApp.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import SwiftUI

@main
struct Movie_DiscoveryApp: App {
    
  @StateObject private var coreData = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreData.persistantContainer.viewContext)
        }
    }
}
