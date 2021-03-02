//
//  AppDelegate.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            window = UIWindow(frame: UIScreen.main.bounds)

        let context = Context()
        let dataSource = SearchViewModelDataSource(context: context)
        let viewController = SearchBuilder.build(with: dataSource)
        let navigationController = UINavigationController.init(rootViewController: viewController)
        self.window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()
        return true
    }
}

