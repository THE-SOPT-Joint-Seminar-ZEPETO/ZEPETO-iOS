//
//  CategoryCVC.swift
//  ZEPETO-iOS
//
//  Created by 변주현 on 2022/05/17.
//

import UIKit

class CategoryCVC: BaseCVC {
    
    // MARK: IBOutlet
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet{
            categoryLabel.textColor = isSelected ? .white : .gray900
            backView.backgroundColor = isSelected ? .gray900 : .gray100
        }
    }
}
