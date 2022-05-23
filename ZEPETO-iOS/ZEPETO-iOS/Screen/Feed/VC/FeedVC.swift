//
//  FeedVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class FeedVC: BaseVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var mainContentLabel: UILabel!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var moreBtn: UIButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        userNameLabel.textDropShadow()
        mainContentLabel.textDropShadow()
        configMainTextLabelShort()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideMoreBtn()
    }
    
    // MARK: IBAction
    @IBAction func tapMoreBtn(_ sender: UIButton) {
        if sender.isSelected {
            mainTextLabel.numberOfLines = 0
            mainTextLabel.invalidateIntrinsicContentSize()
            moreBtn.setTitle("숨기기", for: .normal)
        } else {
            configMainTextLabelShort()
            mainTextLabel.invalidateIntrinsicContentSize()
            moreBtn.setTitle("더보기", for: .normal)
        }
        sender.isSelected.toggle()
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
    
    /// status bar를 흰색으로 바꿔주는 메서드
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// mainTextLabel을 2줄로 만드는 메서드
    private func configMainTextLabelShort() {
        mainTextLabel.numberOfLines = 2
        mainTextLabel.lineBreakMode = .byTruncatingTail
    }

    /// mainTextLabel이 2줄 이하일 때 더보기 버튼을 숨기는 메서드
    private func hideMoreBtn() {
        let lineCount = mainTextLabel.maxNumberOfLines
        if lineCount <= 2 {
            moreBtn.isHidden = true
        }
    }
}
