//
//  ImgCollectionViewCell.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/17.
//

import UIKit
import Kingfisher

class ImgCVC: BaseCVC {

    // MARK: IBOutlet
    @IBOutlet weak var contentImgView: UIImageView!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Custom Methods
extension ImgCVC {
    func setData(_ imgData: Image) {
        guard let imageUrl = URL(string: imgData.imageURL) else { return }
        contentImgView.image = UIImage()
        contentImgView.kf.setImage(with: imageUrl)
    }
}
