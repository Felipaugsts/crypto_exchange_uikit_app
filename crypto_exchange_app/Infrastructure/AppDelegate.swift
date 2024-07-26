//
//  AppDelegate.swift
//  crypto_exchange_app
//
//  Created by Felipe Augusto Silva on 25/07/24.
//

import UIKit
import KeychainSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let keychain = KeychainSwift()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupServiceProvider()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {  }
    
    private func setupServiceProvider() {
        // Base URL
        if let baseURLString = Bundle.main.infoDictionary?["BaseURL"] as? String {
            ServiceProvider.shared.baseURL = baseURLString
        }
        
        // Token
        // We should fetch this token from somewhere and store it safely but on this case I'll just past it here.
        keychain.set("39E9104E-F612-42EE-84C5-8F85DA098507", forKey: "apiToken")
    }
}

