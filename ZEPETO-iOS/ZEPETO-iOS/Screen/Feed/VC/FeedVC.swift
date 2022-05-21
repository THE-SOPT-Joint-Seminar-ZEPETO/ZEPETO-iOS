//
//  FeedVC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class FeedVC: BaseVC {
    
    @IBOutlet weak var mainTextLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
//        mainTextLabel.lineBreakMode = .byCharWrapping
    }
}

// MARK: - Custom Methods
extension FeedVC {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
