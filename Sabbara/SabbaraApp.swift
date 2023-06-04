//
//  SabbaraApp.swift
//  Sabbara
//
//  Created by Omnya Kamal  on 15/05/2023.
//
import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SabbaraApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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


