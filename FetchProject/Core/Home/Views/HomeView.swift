//
//  HomeView.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/8/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        MealListView(menu: vm.menu.meals)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
//                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}
