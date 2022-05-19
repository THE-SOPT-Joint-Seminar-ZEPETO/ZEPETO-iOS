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
    @IBOutlet weak var hashTagView: UIView!
    @IBOutlet weak var mainImgView: UIImageView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
}

// MARK: - UI
extension CreateUploadVC {
    func configUI() {
        mainImgView.makeRounded(cornerRadius: 10)
        hashTagView.makeRounded(cornerRadius: nil)
    }
}

// MARK: - textView placeholder 설정
extension CreateUploadVC {
    /// 텍스트뷰 편집 시작시 placeholder 텍스트를 없애고 색상을 어둡게 변경하는 메서드
    @objc func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray300 {
            textView.text = nil
            textView.textColor = .gray800
        }
    }
    /// 텍스트뷰 편집 종료시 비어있으면 placeholder 텍스트를 추가하는 메서드
    @objc func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "이야기를 완성하세요"
            textView.textColor = .gray300
        }
    }
}
