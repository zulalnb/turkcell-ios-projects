//
//  MainTabbarController.swift
//  CustomTabbarController
//
//  Created by Zülal Nebin on 30.10.2026.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    // selected: #C0D1E1
    // unselected: #DCE0E3
    
    
    @IBOutlet var customTabbarView: UIView!
    @IBOutlet weak var favoritesView: UIView!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var accountImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customTabbarView)
        
        customTabbarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabbarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 44),
            customTabbarView.heightAnchor.constraint(equalToConstant: 84),
            customTabbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            customTabbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        tabBar.isHidden = true
        updateActiveTab(tabIndex: 0)

    }
    
    
    @IBAction func setActiveTab(_ sender: Any) {
        updateActiveTab(tabIndex: (sender as! UIButton).tag)
    }
    
    func updateActiveTab(tabIndex: Int) {
        favoritesView.backgroundColor = .inactive
        accountView.backgroundColor = .inactive
        favoritesImageView.image = .favoriteInactive
        accountImageView.image = .accountInactive

        switch tabIndex {
        case 0:
            favoritesView.backgroundColor = .active
            favoritesImageView.image = .favoriteActive
        case 1:
            accountView.backgroundColor = .active
            accountImageView.image = .accountActive
        default:
            favoritesView.backgroundColor = .active
            favoritesImageView.image = .favoriteActive
        }

        selectedIndex = tabIndex == 1 ? 1 : 0
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
