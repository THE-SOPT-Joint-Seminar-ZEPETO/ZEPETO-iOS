//
//  CreateEditVC.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/19.
//

import UIKit

class CreateEditVC: BaseVC {

    // MARK: IBOutlet
    @IBOutlet weak var img: UIImageView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: IBAction
    @IBAction func TapCloseBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func TapNextBtn(_ sender: Any) {
        // TODO: 다음 VC로 이미지 전달, push로 구현
    }
}

// MARK: - Custom Methods
extension CreateEditVC {
    private func setImg() {
    }
}
