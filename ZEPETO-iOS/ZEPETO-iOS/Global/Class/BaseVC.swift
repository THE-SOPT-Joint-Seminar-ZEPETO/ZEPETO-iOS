//
//  BaseVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit
import SnapKit
import Then
import Lottie

class BaseVC: UIViewController {

    // MARK: Properties
    let bgView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.isHidden = true
    }
    
    let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.makeRounded(cornerRadius: 8.adjusted)
        $0.isHidden = true
    }
    
    lazy var loadingView: AnimationView = {
        let animationView = AnimationView(name: "loading_lottie")
        animationView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.isHidden = true
        
        return animationView
    }()
    
    lazy var checkView: AnimationView = {
        let animationView = AnimationView(name: "check_lottie")
        animationView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.isHidden = true
        
        return animationView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.addBorder(.top, color: .gray600, thickness: 0.3)
    }
}

// MARK: - UI
extension BaseVC {
    func setLottie() {
        view.addSubviews([bgView, containerView])
        containerView.addSubviews([loadingView, checkView])
        
        bgView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(64)
        }
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
    
    func loadingPlay() {
        bgView.isHidden = false
        containerView.isHidden = false
        loadingView.isHidden = false
        loadingView.play()
    }
    
    func loadingStop() {
        loadingView.stop()
        bgView.isHidden = true
        containerView.isHidden = true
        loadingView.isHidden = true
    }
    
    func checkPlay(_ vc: UIViewController) {
        bgView.isHidden = false
        containerView.isHidden = false
        checkView.isHidden = false
        checkView.play() { _ in
            vc.dismiss(animated: true)
        }
    }
    
    func checkStop() {
        bgView.isHidden = true
        containerView.isHidden = true
        checkView.isHidden = true
        checkView.stop()
    }
}
