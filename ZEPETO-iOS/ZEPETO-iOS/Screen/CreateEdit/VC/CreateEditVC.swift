//
//  CreateEditVC.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/19.
//

import UIKit

class CreateEditVC: BaseVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var selectedImgView: UIImageView!
    
    // MARK: Properties
    var selectedImg = UIImage()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setImg()
    }
    
    // MARK: IBAction
    @IBAction func tapCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapNextBtn(_ sender: UIButton) {
        guard let uploadVC = UIStoryboard.init(name: Identifiers.CreateUploadSB, bundle: nil).instantiateViewController(withIdentifier: CreateUploadVC.className) as? CreateUploadVC else { return }
        
        uploadVC.selectedImg = selectedImgView.image ?? selectedImg
        self.navigationController?.pushViewController(uploadVC, animated: true)
    }
}

// MARK: - Custom Methods
extension CreateEditVC {
    private func setImg() {
        selectedImgView.image = selectedImg
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
