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
    let imagePicker = UIImagePickerController()
    var postList: [MainImagesGetResModel] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPostTV()
        setCategoryCV()
        setImagePicker()
        
        /// 이미지 데이터 조회 서버 통신
        imagesGet()
    }
    
    // MARK: IBAction
    @IBAction func tapUploadBtn(_ sender: Any) {
        openGallery()
    }
}

// MARK: - Custom Methods
extension CreateMainVC {
    private func setPostTV() {
        PostTVC.register(target: postTV)
        postTV.delegate = self
        postTV.dataSource = self
    }
    
    private func setCategoryCV() {
        CategoryCVC.register(target: categoryCV)
        categoryCV.delegate = self
        categoryCV.dataSource = self
        categoryCV.selectItem(at: IndexPath(item: 1, section: 0), animated: true, scrollPosition: .left)
    }
    
    private func setImagePicker() {
        imagePicker.delegate = self
    }
    
    private func openGallery(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.modalPresentationStyle = .fullScreen
        present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate
extension CreateMainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = (postList[indexPath.row].images.count == 2) ? 268.adjustedH : 207.adjustedH
        
        return height
    }
}

// MARK: - UITableViewDataSource
extension CreateMainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTVC.className, for: indexPath) as? PostTVC else { return UITableViewCell() }
        
        cell.setData(postList[indexPath.row])
        
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
        cell.categoryLabel.text = categoryList[indexPath.row]
        cell.makeRounded(cornerRadius: nil)
        cell.categoryLabel.sizeToFit()
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CreateMainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryList[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]).width + 28, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 18, bottom: 14, right: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension CreateMainVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let createEditVC = UIStoryboard.init(name: Identifiers.CreateEditSB, bundle: nil).instantiateViewController(withIdentifier: CreateEditVC.className) as? CreateEditVC else { return }
        
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            createEditVC.selectedImg = img
        }
        
        self.dismiss(animated: false) {
            let creatEditNC = UINavigationController(rootViewController: createEditVC)
            creatEditNC.isNavigationBarHidden = true
            creatEditNC.modalPresentationStyle = .fullScreen
            self.present(creatEditNC, animated: true)
        }
    }
}

// MARK: - Network
extension CreateMainVC {
    private func imagesGet() {
        MainAPI.shared.imagesGetAPI() { networkResult in
            switch networkResult {
            case .success(let res):
                if let data = res as? [MainImagesGetResModel] {
                    DispatchQueue.main.async {
                        self.postList = data
                        self.postTV.reloadData()
                    }
                }
            case .requestErr(let res):
                print(res)
            default:
                print("networkFail")
            }
            
        }
    }
}
