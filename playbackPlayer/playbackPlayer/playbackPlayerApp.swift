//
//  playbackPlayerApp.swift
//  playbackPlayer
//
//  Created by Abdalla Elnajjar on 2023-12-19.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct playbackPlayerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
