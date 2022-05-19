//
//  PostDataModel.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/17.
//

import UIKit

struct PostDataModel {
    let profileImgName: String
    var profileImg: UIImage? {
        return UIImage(named: profileImgName)
    }
    let title: String
    let description: String
    var imgList: [ImgDataModel]
}

extension PostDataModel {
    static let sampleData: [PostDataModel] = [
        PostDataModel(profileImgName: "writerThumbnail", title: "ZEPETO 신상 포즈", description: "제일 먼저 해보세요!", imgList: [ImgDataModel(imgName: "posethumbnail1"), ImgDataModel(imgName: "posethumbnail2")]),
        PostDataModel(profileImgName: "writerThumbnail", title: "트렌드 포즈", description: "최신 트렌드 한 눈에 보기!", imgList: [ImgDataModel(imgName: "posethumbnail3"), ImgDataModel(imgName: "posethumbnail4"), ImgDataModel(imgName: "posethumbnail5")]),
        PostDataModel(profileImgName: "writerThumbnail", title: "Minnie Mouse", description: "Special Event Booth🎀", imgList: [ImgDataModel(imgName: "posethumbnail6"), ImgDataModel(imgName: "posethumbnail7")]),
        PostDataModel(profileImgName: "writerThumbnail", title: "Nice to CU♥", description: "CU in a ZEPETO", imgList: [ImgDataModel(imgName: "posethumbnail8"), ImgDataModel(imgName: "posethumbnail9")]),
        PostDataModel(profileImgName: "writerThumbnail", title: "SF9", description: "To be Sensation SF9!", imgList: [ImgDataModel(imgName: "posethumbnail10"), ImgDataModel(imgName: "posethumbnail11"), ImgDataModel(imgName: "posethumbnail12")]),
    ]
}
