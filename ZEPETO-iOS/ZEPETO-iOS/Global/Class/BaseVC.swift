//
//  BaseVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit
import Lottie

class BaseVC: UIViewController {

    // MARK: Properties
    let loadingView = AnimationView(name: "loading_lottie")
    let checkView = AnimationView(name: "check_lottie")
    
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
    
    func setLottie() {
        loadingView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        loadingView.center = self.view.center
        loadingView.contentMode = .scaleAspectFit
        loadingView.loopMode = .loop
        loadingView.isHidden = true
        view.addSubview(loadingView)
        
        checkView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        checkView.center = self.view.center
        checkView.contentMode = .scaleAspectFit
        checkView.loopMode = .playOnce
        checkView.isHidden = true
        view.addSubview(checkView)
    }
    
    func loadingPlay() {
        loadingView.isHidden = false
        loadingView.play()
    }
    
    func loadingStop() {
        loadingView.stop()
        loadingView.isHidden = true
    }
    
    func checkPlay(_ vc: UIViewController) {
        checkView.isHidden = false
        checkView.play() { _ in
            vc.dismiss(animated: true)
        }
    }
    
    func checkStop() {
        checkView.stop()
        checkView.isHidden = true
    }
}
