//
//  MealListView.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/8/23.
//

import SwiftUI

struct MealListView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var searchText: String = ""
    var menu: [Meal]
    
    var body: some View {
        VStack {
            HeaderView
            SearchBarView(searchText: $vm.searchText)
            ListView
        }
        .padding(.horizontal)
        .refreshable {
            vm.reloadData()
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            MealListView(menu: dev.menu)
                .environmentObject(HomeViewModel())
        }
    }
}

extension MealListView {
    
    private var HeaderView: some View {
        HStack {
            Text("\(menu.count) \(menu.count > 1 ? "meals" : "meal")")
                .font(.headline)
                .fontWeight(.medium)
                .opacity(0.7)
            
            Spacer()
        }
    }
    
    private var ListView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)]) {
                ForEach(menu) { meal in
                    NavigationLink(destination: DetailView(meal: meal)) {
                        MealCard(meal: meal)
                    }
                }
            }
            .padding(.top)
        }
    }
}
