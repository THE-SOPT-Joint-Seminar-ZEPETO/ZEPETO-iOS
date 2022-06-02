//
//  PostTableViewCell.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/17.
//

import UIKit
import Kingfisher

class PostTVC: BaseTVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imgCV: UICollectionView!
    
    // MARK: Properties
    var imgList: [Image] = []
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setImgCV()
    }
}

// MARK: - Custom Methods
extension PostTVC {
    func setData(_ postData: MainImagesGetResModel) {
        guard let imageUrl = URL(string: postData.profileImage) else { return }
        profileImgView.image = UIImage()
        profileImgView.kf.setImage(with: imageUrl)
        titleLabel.text = postData.title
        descriptionLabel.text = postData.description
        imgList = postData.images
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
        if imgList.count == 2 {
            return UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        } else {
            return UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spacingSize = (imgList.count == 2) ? 17 : 14
        
        return CGFloat(spacingSize)
    }
}
