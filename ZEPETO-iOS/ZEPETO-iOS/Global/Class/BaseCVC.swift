//
//  BaseCVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class BaseCVC: UICollectionViewCell {
    
}

// MARK: - CVRegisterable
extension BaseCVC: CVRegisterable {
    
    static var isFromNib: Bool {
        get {
            return true
        }
    }
}
