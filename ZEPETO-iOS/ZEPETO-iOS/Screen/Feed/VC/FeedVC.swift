//
//  FeedVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class FeedVC: BaseVC {
    
    // MARK: IBOutlet
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
    }
}

// MARK: - Custom Methods
extension FeedVC {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
