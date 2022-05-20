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
    @IBOutlet weak var darkBGView: UIView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // [?] 궁금한게 이거 스보에도 똑같이 컬러 gray300으로 설정했는데 뷰컨에서 아래처럼 따로 설정해주지 않으면 밑에 placeholder 설정이 안 먹더라구요? 왜그럴까요?? 원래 그런건가요???🤔
    // MARK: UI
    func configUI() {
        mainTextView.textColor = .gray300
        darkBGView.isHidden = true
        mainTextView.delegate = self
    }
}

// MARK: - textView placeholder 설정
extension CreateUploadVC: UITextViewDelegate {
    /// 텍스트뷰 편집 시작시 placeholder 텍스트를 없애고 색상을 어둡게 변경하는 메서드
    func textViewDidBeginEditing(_ textView: UITextView) {
        darkBGView.isHidden = false
        if textView.textColor == .gray300 {
            textView.text = nil
            textView.textColor = .gray800
        }
    }
    /// 텍스트뷰 편집 종료시 비어있으면 placeholder 텍스트를 추가하는 메서드
    func textViewDidEndEditing(_ textView: UITextView) {
        darkBGView.isHidden = true
        if textView.text.isEmpty {
            textView.text = "이야기를 완성하세요"
            textView.textColor = .gray300
        }
    }
}
