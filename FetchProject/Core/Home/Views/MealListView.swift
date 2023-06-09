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
            HStack {
                Text("\(menu.count) \(menu.count > 1 ? "meals" : "meal")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            SearchBarView(searchText: $vm.searchText)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)]) {
                    ForEach(menu) { meal in
                        MealCard(meal: meal)
                    }
                }
                .padding(.top)
            }
        }
        .padding(.horizontal)
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
