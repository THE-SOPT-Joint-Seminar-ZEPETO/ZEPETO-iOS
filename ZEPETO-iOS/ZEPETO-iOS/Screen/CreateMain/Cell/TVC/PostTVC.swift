//
//  PostTableViewCell.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/17.
//

import UIKit

class PostTVC: BaseTVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imgCV: UICollectionView!
    
    // MARK: Properties
    var imgList: [ImgDataModel] = []
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setImgCV()
    }
}

// MARK: - Custom Methods
extension PostTVC {
    func setData(_ postData: PostDataModel) {
        profileImgView.image = postData.profileImg
        titleLabel.text = postData.title
        descriptionLabel.text = postData.description
        imgList = postData.imgList
    }
    
    private func setImgCV() {
        ImgCVC.register(target: imgCV)
        imgCV.delegate = self
        imgCV.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate
extension PostTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgList.count
    }
}

// MARK: - UICollectionViewDataSource
extension PostTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImgCVC.className, for: indexPath) as? ImgCVC else {
            return UICollectionViewCell()
        }
        cell.setData(imgList[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PostTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (imgList.count == 2) ? 163.adjusted : 104.adjusted
        let cellHeight = (imgList.count == 2) ? 170.adjusted : 109.adjusted
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = (imgList.count == 2) ? 16.0 : 18.0
        
        return UIEdgeInsets(top: 12, left: inset, bottom: 12, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spacingSize = (imgList.count == 2) ? 17 : 14
        
        return CGFloat(spacingSize)
    }
}
