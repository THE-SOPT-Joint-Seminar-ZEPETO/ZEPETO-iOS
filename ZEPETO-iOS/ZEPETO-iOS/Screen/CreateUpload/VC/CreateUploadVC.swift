//
//  CreateUploadVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class CreateUploadVC: BaseVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var darkBgView: UIView!
    @IBOutlet weak var contentImgView: UIImageView!
    
    // MARK: Properties
    var selectedImg = UIImage()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setDelegate()
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UI
extension CreateUploadVC {
    private func configUI() {
        mainTextView.textColor = .gray300
        darkBgView.isHidden = true
        contentImgView.makeRounded(cornerRadius: 10.adjusted)
        contentImgView.image = selectedImg
    }
}

// MARK: - Custom Methods
extension CreateUploadVC {
    private func setDelegate() {
        mainTextView.delegate = self
    }
}

// MARK: - UITextViewDelegate
extension CreateUploadVC: UITextViewDelegate {
    
    /// 텍스트뷰 편집 시작시 placeholder 텍스트를 없애고 색상을 어둡게 변경하는 메서드
    func textViewDidBeginEditing(_ textView: UITextView) {
        darkBgView.isHidden = false
        if textView.textColor == .gray300 {
            textView.text = nil
            textView.textColor = .gray800
        }
    }
    
    /// 텍스트뷰 편집 종료시 비어있으면 placeholder 텍스트를 추가하는 메서드
    func textViewDidEndEditing(_ textView: UITextView) {
        darkBgView.isHidden = true
        if textView.text.isEmpty {
            textView.text = "이야기를 완성하세요"
            textView.textColor = .gray300
        }
    }
}
