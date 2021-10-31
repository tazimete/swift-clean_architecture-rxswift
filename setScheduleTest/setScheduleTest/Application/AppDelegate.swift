//
//  AppDelegate.swift
//  tawktestios
//
//  Created by JMC on 23/7/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: GithubCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        
        //build app configuration
        buildAppConfig()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
       
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    private func buildAppConfig() -> Void {
        //builder, build -> return theme
        let theme = AppTheme.Builder()
            .addColors(colors: Colors())
            .addFonts(fonts: Fonts())
            .build()

        //server/api config builder
        let serverConfig = ServerConfig.Builder()
            .addBaseUrl(baseUrl: "")
            .addApiVersion(apiVersion: "3")
            .addAuthCredential(credential: AuthCredential())
            .addBuildType(buildType: .DEVELOP)
            .build()

        //Singleton with builder, commit-> no return
        AppConfig.Builder()
            .setServerConfig(serverConfig: serverConfig)
            .setThemeType(themeType: .DARK)
            .setNormalTheme(theme: theme)
            .setDarkTheme(theme: theme)
            .setLocale(local: "en")
            .commit()
    }

}

