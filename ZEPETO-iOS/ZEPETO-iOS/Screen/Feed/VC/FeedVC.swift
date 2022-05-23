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
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configMoreBtnHide()
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
        sender.isSelected = !sender.isSelected
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
        configMainTextLabelShort()
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
    private func configMoreBtnHide() {
        let lineCount = mainTextLabel.maxNumberOfLines
        if lineCount <= 2 {
            moreBtn.isHidden = true
        }
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
    
    /// UILabel의 총 Line 수를 구하는 메서드
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font!], context: nil).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
}
