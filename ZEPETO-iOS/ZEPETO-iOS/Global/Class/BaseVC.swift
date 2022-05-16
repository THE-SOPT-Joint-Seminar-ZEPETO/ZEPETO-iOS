//
//  BaseVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class BaseVC: UIViewController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.addBorder(.top, color: .gray600, thickness: 0.3)
    }
}

// MARK: - Custom Methods
extension BaseVC {
    func hideTabbar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func showTabbar() {
        self.tabBarController?.tabBar.isHidden = false
    }
}
