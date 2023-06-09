//
//  DetailView.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/9/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var vm: DetailViewModel
    
    init(meal: Meal) {
        vm = DetailViewModel(meal: meal)
    }
    
    var body: some View {
        ScrollView {
            if let mealDetail = vm.mealDetail {
                VStack {
                    Image(uiImage: vm.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    VStack(spacing: 30) {
                        Text(mealDetail.strMeal)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                        Text(mealDetail.strInstructions)
                            .font(.headline)
                            .fontWeight(.light)
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Ingredients")
                                .font(.headline)
                            ForEach(mealDetail.ingredients, id: \.0) { ingredient, measure in
                                HStack {
                                    Text(ingredient)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(measure)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .padding()
            } else {
                // Handle case when meal detail is not loaded yet
                ProgressView()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(meal: dev.meal)
            .environmentObject(dev.homeVM)
    }
}
