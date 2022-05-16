//
//  TVRegisterable.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

protocol TVRegisterable {
    static var isFromNib: Bool { get }
    static func register(target: UITableView)
}

extension TVRegisterable where Self: UITableViewCell {
    static func register(target: UITableView) {
        if self.isFromNib {
            target.register(UINib(nibName: Self.className, bundle: nil), forCellReuseIdentifier: Self.className)
        } else {
            target.register(Self.self, forCellReuseIdentifier: Self.className)
        }
    }
}
