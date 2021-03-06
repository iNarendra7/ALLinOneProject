//
//  APP_FUNCTIONS.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/27/21.
//


import Foundation
import UIKit
//import PopMenu
import AVFoundation

func createDashBoard() {
    let window = UIApplication.shared.windows[0]
    let tabBarController : EpicTabBarController = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "EpicTabBarController") as! EpicTabBarController

    window.rootViewController = tabBarController
    if #available(iOS 13.0, *) {
        window.overrideUserInterfaceStyle = .dark
    } else {
        // Fallback on earlier versions
//        window.user
    }
    window.makeKeyAndVisible()
}


func getBannerHeight()->CGFloat{
    return (AppUtility.getScreenWidth() - 40) * 0.65 //AppUtility.isIpad() ? 250 : 220
}

func getPodcastContentSize(height: CGFloat) -> CGSize {
    return CGSize(width: height, height: height)
}
