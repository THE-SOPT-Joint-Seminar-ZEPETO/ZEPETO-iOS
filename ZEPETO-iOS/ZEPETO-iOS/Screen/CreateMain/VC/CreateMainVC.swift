//
//  CreateMainVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class CreateMainVC: BaseVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var postTV: UITableView!
    @IBOutlet weak var categoryCV: UICollectionView!
    
    // MARK: Properties
    var categoryList = ["MY", "HOT", "NEW", "템플릿", "커플", "Photo"]
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPostTV()
        setCategoryCV()
    }
}

// MARK: - Custom Methods
extension CreateMainVC {
    
    /// TV 관련 설정하는 메서드
    private func setPostTV() {
        let nib = UINib(nibName: PostTVC.className, bundle: nil)
        postTV.register(nib, forCellReuseIdentifier: PostTVC.className)
        postTV.delegate = self
        postTV.dataSource = self
    }
    
    /// 카테고리 CV 관련 설정하는 메서드
    private func setCategoryCV() {
        let nib = UINib(nibName: CategoryCVC.className, bundle: nil)
        categoryCV.register(nib, forCellWithReuseIdentifier: CategoryCVC.className)
        
        categoryCV.delegate = self
        categoryCV.dataSource = self
    }
}

// MARK: - UITableViewDelegate
extension CreateMainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 268
    }
}

// MARK: - UITableViewDataSource
extension CreateMainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVC.className, for: indexPath) as? PostTVC else { return UITableViewCell() }
        
        cell.setData(PostDataModel.sampleData[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CreateMainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
}

// MARK: - UICollectionViewDataSource
extension CreateMainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVC.className, for: indexPath) as? CategoryCVC else {
            return UICollectionViewCell()
        }
        cell.categoryBtn.setTitle(categoryList[indexPath.item], for: .normal)
        if (indexPath.item == 1) {
            cell.categoryBtn.setTitleColor(.white, for: .normal)
            cell.categoryBtn.setBackgroundColor(.gray900, for: .normal)
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CreateMainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryList[indexPath.item].size(withAttributes: nil).width + 28, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 18, bottom: 14, right: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
