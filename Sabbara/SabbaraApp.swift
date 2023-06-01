//
//  SabbaraApp.swift
//  Sabbara
//
//  Created by Omnya Kamal  on 15/05/2023.
//
import SwiftUI
@main
struct SabbaraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AllModifiers()
            
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.locale, .init(identifier: "ar"))
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}


