//
//  MealView.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/8/23.
//

import Foundation
import SwiftUI

struct MealCard: View {
    @ObservedObject var vm: MealImageViewModel
    
    init(meal: Meal) {
        vm = MealImageViewModel(meal: meal)
    }
    
    var body: some View {
        VStack {
            ZStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .bottom) {
                            Text(vm.meal.strMeal)
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: 136)
                                .padding()
                        }
                } else if vm.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct MealCard_Preview: PreviewProvider {
    static var previews: some View {
        MealCard(meal: dev.meal)
    }
}
