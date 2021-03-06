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
    @IBOutlet weak var contentImgView: UIImageView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configMainTextLabelShort()
        getFeed()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFeed()
        hideMoreBtn()
    }
    
    // MARK: IBAction
    @IBAction func tapMoreBtn(_ sender: UIButton) {
        if sender.isSelected {
            mainContentLabel.numberOfLines = 0
            mainContentLabel.invalidateIntrinsicContentSize()
            moreBtn.setTitle("숨기기", for: .normal)
        } else {
            configMainTextLabelShort()
            mainContentLabel.invalidateIntrinsicContentSize()
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
        userNameLabel.textDropShadow()
        mainContentLabel.textDropShadow()
    }
    
    /// status bar를 흰색으로 바꿔주는 메서드
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// mainTextLabel을 2줄로 만드는 메서드
    private func configMainTextLabelShort() {
        mainContentLabel.numberOfLines = 2
        mainContentLabel.lineBreakMode = .byTruncatingTail
    }

    /// mainTextLabel이 2줄 이하일 때 더보기 버튼을 숨기는 메서드
    private func hideMoreBtn() {
        let lineCount = mainContentLabel.maxNumberOfLines
        lineCount <= 2 ? (moreBtn.isHidden = true) : (moreBtn.isHidden = false)
    }
}

// MARK: - Network
extension FeedVC {
    private func getFeed() {
        FeedAPI.shared.feedGetAPI() { networkResult in
            switch networkResult {
            case .success(let res):
                if let data = res as? FeedGetResModel {
                    self.profileImgView.load(url: URL(string: data.userProfileImage)!)
                    self.userNameLabel.text = data.userName
                    self.contentImgView.load(url: URL(string: data.image)!)
                    self.mainContentLabel.text = data.content ?? "작성한 글이 없습니다."
                    self.hideMoreBtn()
                }
            case .requestErr(let res):
                print(res)
            default:
                print("networkFail")
            }
        }
    }
}
