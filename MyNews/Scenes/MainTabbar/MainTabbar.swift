//
//  MainTabbar.swift
//  MyNews
//
//  Created by Bryan Barreto on 30/08/21.
//

import UIKit

class MainTabbar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure() {
        let topHeadlines = buildScreen(title: "Headlines", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        self.viewControllers = [topHeadlines]
    }
    
    func buildScreen(title: String, image: UIImage?, selectedImage: UIImage?, hasNavigationController: Bool = false) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        if hasNavigationController {
            let nav = UINavigationController(rootViewController: vc)
            nav.navigationBar.prefersLargeTitles = true
            return nav
        }
        return vc
    }
}
