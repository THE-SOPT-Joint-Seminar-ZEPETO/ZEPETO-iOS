//
//  ImgCollectionViewCell.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/17.
//

import UIKit

class ImgCVC: BaseCVC {

    // MARK: IBOutlet
    @IBOutlet weak var img: UIImageView!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

// MARK: - Custom Methods
extension ImgCVC {
    func setData(_ imgData: ImgDataModel) {
        img.image = imgData.img
    }
}
