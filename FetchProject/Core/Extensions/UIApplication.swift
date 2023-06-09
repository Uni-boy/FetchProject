//
//  UIApplication.swift
//  FetchProject
//
//  Created by Xinzhuo Liu on 6/9/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
