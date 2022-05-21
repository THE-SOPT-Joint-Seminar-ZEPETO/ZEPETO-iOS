//
//  FeedVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class FeedVC: BaseVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI
extension FeedVC {
    private func configUI() {
        profileImgView.layer.borderWidth = 2
        profileImgView.layer.borderColor = UIColor.white.cgColor
        profileImgView.layer.cornerRadius = profileImgView.bounds.width / 2
        
        usernameTextLabel.textDropShadow()
        mainTextLabel.textDropShadow()
    }
}

// MARK: - Custom Methods
extension FeedVC {
    
    /// status bar를 흰색으로 바꿔주는 메서드
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - [?] 여기다 뭐라고 더 달아야 할까요??
extension UILabel {
    
    /// 텍스트에 그림자를 주는 메서드
    func textDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
