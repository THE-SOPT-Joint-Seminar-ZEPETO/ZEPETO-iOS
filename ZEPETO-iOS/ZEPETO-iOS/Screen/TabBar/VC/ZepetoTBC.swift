//
//  ZepetoTBC.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import UIKit

class ZepetoTBC: UITabBarController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        addObserver()
    }
}

// MARK: - UI
extension ZepetoTBC {
    
    /// 탭바 아이템 생성하는 메서드
    func makeTabVC(vcType: TypeOfViewController, tabBarTitle: String, tabBarImg: String, tabBarSelectedImg: String) -> UIViewController {
        
        let tab = ViewControllerFactory.viewController(for: vcType)
        tab.tabBarItem = UITabBarItem(title: tabBarTitle,
                                      image: UIImage(named: tabBarImg)?.withRenderingMode(.alwaysTemplate),
                                      selectedImage: UIImage(named: tabBarSelectedImg)?.withRenderingMode(.alwaysTemplate))
        tab.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        return tab
    }
    
    /// 탭바 구성하는 메서드
    func configTabBar() {
        
        let homeTab = makeTabVC(vcType: .home, tabBarTitle: "", tabBarImg: "icHouseLine", tabBarSelectedImg: "icHouseLine")
        let planetTab = makeTabVC(vcType: .planet, tabBarTitle: "", tabBarImg: "icPlanetLine", tabBarSelectedImg: "icPlanetLine")
        let createTab = makeTabVC(vcType: .create, tabBarTitle: "", tabBarImg: "icPlusLineSquare", tabBarSelectedImg: "icPlusFillSquare")
        let feedTab = makeTabVC(vcType: .feed, tabBarTitle: "", tabBarImg: "icFeedLine", tabBarSelectedImg: "icFeedFill")
        let mypageTab = makeTabVC(vcType: .mypage, tabBarTitle: "", tabBarImg: "icUserLine", tabBarSelectedImg: "icUserLine")
        
        /// 탭 구성
        let tabs = [homeTab, planetTab, createTab, feedTab, mypageTab]
        
        /// VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
        
        /// 디폴트 탭 설정
        self.selectedIndex = 2
        
        /// 탭 바 디폴트 UI  설정
        tabBar.backgroundColor = .white
        tabBar.tintColor = .gray900
        tabBar.unselectedItemTintColor = .gray900
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(setTabBarIndex), name: NSNotification.Name("completeBtnDidTap"), object: nil)
    }
    
    @objc func setTabBarIndex() {
        self.selectedIndex = 3
        tabBar.backgroundColor = .black
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
    }
}

// MARK: - UITabBarControllerDelegate
extension ZepetoTBC: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (self.tabBar.items!)[3] {
            tabBar.backgroundColor = .black
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        } else {
            tabBar.backgroundColor = .white
            tabBar.tintColor = .gray900
            tabBar.unselectedItemTintColor = .gray900
        }
    }
}
