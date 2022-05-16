//
//  ViewControllerFactory.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class ViewControllerFactory: NSObject {
    
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let metaData = typeOfVC.storyboardRepresentation()
        let sb = UIStoryboard(name: metaData.storyboardName, bundle: metaData.bundle)
        let vc = sb.instantiateViewController(withIdentifier: metaData.storyboardId)
        return vc
    }
}
