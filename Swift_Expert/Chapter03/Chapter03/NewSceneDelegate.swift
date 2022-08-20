//
//  NewSceneDelegate.swift
//  Chapter03
//
//  Created by 강동영 on 2022/08/20.
//

import UIKit

class NewSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        tbC.tabBar.tintColor = .white
        tbC.tabBar.unselectedItemTintColor = .gray
        tbC.tabBar.backgroundColor = .black
        self.window?.rootViewController = tbC
        
        let view01 = FirstViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        
        tbC.setViewControllers([view01, view02, view03], animated: false)
        
        view01.tabBarItem = UITabBarItem(title: "Calenar", image: UIImage(systemName: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "File", image: UIImage(systemName: "doc"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(systemName: "photo"), selectedImage: nil)
    }
}
