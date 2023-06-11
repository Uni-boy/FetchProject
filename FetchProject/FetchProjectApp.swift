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
    
    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MealListView(menu: vm.menu.meals)
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
