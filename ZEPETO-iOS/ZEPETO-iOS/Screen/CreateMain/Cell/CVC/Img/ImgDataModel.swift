//
//  ImgDataModel.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/18.
//

import UIKit

struct ImgDataModel {
    let imgName: String
    var img: UIImage? {
        return UIImage(named: imgName)
    }
}
