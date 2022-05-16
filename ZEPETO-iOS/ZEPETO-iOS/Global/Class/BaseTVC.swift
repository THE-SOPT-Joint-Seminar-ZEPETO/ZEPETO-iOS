//
//  BaseTVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class BaseTVC: UITableViewCell {
    
}

// MARK: - TVRegisterable
extension BaseTVC: TVRegisterable {
    
    static var isFromNib: Bool {
        get {
            return true
        }
    }
}
