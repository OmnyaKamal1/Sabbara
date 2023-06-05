//
//  Rounds.swift
//  swiftuiMVVM
//
//  Created by Rand Alhassoun on 10/23/21.
//

//MODEL
//import SwiftUI
import Foundation

struct Rounds: Identifiable {
    
    var id = UUID()
    var CategoryName: String
    var category: Int //String؟
    //var xcategory: String //String؟

    let words: [String]

    var description: String
    var icon: String


//    var email: String
//    var phoneNumber: String
}
