//
//  TabBar.swift
//  submission
//
//  Created by Ade Resie on 01/10/22.
//

import UIKit

class TabBar: UITabBarController {
    
    private lazy var profileBtn = UIBarButtonItem(image: UIImage(named: "ic_person"), style: .plain, target: self, action: #selector(toAbout))
    private var titleVC = "Home"
    
    @objc private func toAbout() {
        navigationController?.pushViewController(AboutRouter.createModule(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        setupNavBar(title: titleVC, isBorderless: false)
        navigationItem.rightBarButtonItem  = profileBtn
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .systemBlue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Home"
        delegate = self
        setupVCs()
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: HomeRouter.createModule(type: .all), title: "Home", image: UIImage(named: "ic_home")!),
            createNavController(for: HomeRouter.createModule(type: .favorite), title: "Favorites", image: UIImage(named: "ic_favorite_fill")!)
        ]
    }

    private func createNavController(for viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let uiTabBar = UITabBarItem(title: title, image: image, selectedImage: image)
        viewController.title = title
        viewController.tabBarItem = uiTabBar
        return viewController
    }
}

extension TabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        titleVC = viewController.title!
        title = titleVC
    }
}
