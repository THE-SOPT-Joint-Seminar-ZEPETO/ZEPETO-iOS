//
//  TypeOfViewController.swift
//  ZEPETO-iOS
//
//  Created by EUNJU on 2022/05/16.
//

import Foundation

enum TypeOfViewController {
    case tabBar
    case home
    case planet
    case create
    case feed
    case mypage
}

extension TypeOfViewController {
    
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
            
        case .tabBar:
            return StoryboardRepresentation(bundle: nil, storyboardName: "", storyboardId: ZepetoTBC.className)
        case .home:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.HomeSB, storyboardId: HomeNC.className)
        case .planet:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.PlanetSB, storyboardId: PlanetNC.className)
        case .create:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.CreateMainSB, storyboardId: CreateNC.className)
        case .feed:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.FeedSB, storyboardId: FeedNC.className)
        case .mypage:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.MypageSB, storyboardId: MypageNC.className)
        }
    }
}
