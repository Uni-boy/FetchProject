//
//  FetchProjectApp.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/5/23.
//

import SwiftUI

@main
struct FetchProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
