//
//  EpicTabBarController.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/27/21.
//

import Foundation
import UIKit




class EpicTabBarController : UITabBarController {

    var tabClicked: (()->Void)?
    let layerGradient = CAGradientLayer()
    let gradientColor1: String = "5b103c"
    let gradientColor2: String = "642710"
   
    var tabBarObjects : [tabObjects] = []
    override func viewDidLoad() {
        self.delegate = self

       // self.setTabBarControllers()
        if let tabBarController = self.tabBarController {

            let indexToRemove = 3
            if indexToRemove < tabBarController.viewControllers!.count {
                var viewControllers = tabBarController.viewControllers
                viewControllers?.remove(at: indexToRemove)
                tabBarController.viewControllers = viewControllers
            }
        }
        
    }
    var didStyleTabBar = false
    override func viewWillLayoutSubviews() {
            if !didStyleTabBar {
                self.tabBar.invalidateIntrinsicContentSize()
                var tabFrame = self.tabBar.frame

                //tabFrame.size.height = tabBarHeight
                tabFrame.origin.y = tabFrame.origin.y - 200//_miniMediaControlsContainerView.frame.height//44
                self.tabBar.frame = tabFrame

                didStyleTabBar = true
            }
        }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
//
//    func setTabBarControllers() {
//        //Stack up ViewController
//        let homeVc = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        let homeNav = UINavigationController(rootViewController: homeVc)
//        homeNav.isNavigationBarHidden = true
//        var homeObjectDic : [String:Any] = [:]
//        homeObjectDic["file"] = homeNav
//        homeObjectDic["selected"] = ThemeManager.currentTheme().tabBarBottomHomeImageSel
//        homeObjectDic["unselected"] = ThemeManager.currentTheme().tabBarBottomHomeImage
//        homeObjectDic["title"] = LabelText.title_home.localized//"Home"
//        let homeObj = tabObjects.init(fromDictionary: homeObjectDic)
//        //-tabBarObjects.append(homeObj)
//
////        let searchVC = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "NewSearchViewController") as! NewSearchViewController
//        let searchVC : UIViewController!
//        if ThemeManager.currentTheme() == .Kids {
//            searchVC = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//        } else {
//            searchVC = NewSearchViewController(nibName: "NewSearchViewController", bundle: .main)
//        }
//        let searchNav = UINavigationController(rootViewController: searchVC)
//        searchNav.isNavigationBarHidden = true
//        var SearchDic : [String:Any] = [:]
//        SearchDic["file"] = searchNav
//        SearchDic["selected"] = ThemeManager.currentTheme().tabBarBottomSearchImageSel
//        SearchDic["unselected"] = ThemeManager.currentTheme().tabBarBottomSearchImage
//        SearchDic["title"] = LabelText.search.localized//"Search"
//        let searchObj = tabObjects.init(fromDictionary: SearchDic)
//        //-tabBarObjects.append(searchObj)
//
//        let LiveVC = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "LiveTVVC") as! LiveTVVC
//        let LiveNav = UINavigationController(rootViewController: LiveVC)
//        LiveNav.isNavigationBarHidden = true
//        var LiveDict : [String:Any] = [:]
//        LiveDict["file"] = LiveNav
//        LiveDict["selected"] = #imageLiteral(resourceName: "LiveTV_selected")
//        LiveDict["unselected"] = #imageLiteral(resourceName: "LiveTV_unselected")
//        LiveDict["title"] = LabelText.livetv.localized//"Live TV"
//        let liveObj = tabObjects.init(fromDictionary: LiveDict)
//        //-tabBarObjects.append(liveObj)
//
//
//
//        let MyListVC = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "MyListVC") as! MyListVC
//        let MyListNav = UINavigationController(rootViewController: MyListVC)
//        MyListNav.isNavigationBarHidden = true
//        var myListDict : [String:Any] = [:]
//        myListDict["file"] = MyListNav
//        myListDict["selected"] = #imageLiteral(resourceName: "MyList_selected")
//        myListDict["unselected"] = #imageLiteral(resourceName: "MyList_unselected")
//        myListDict["title"] = LabelText.mylist.localized//"My List"
//        let myListObj = tabObjects.init(fromDictionary: myListDict)
////        tabBarObjects.append(myListObj)
//
//        let DownloadVC = DownloadsVC()//StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "DownloadsVC") as! DownloadsVC
//        DownloadVC.hideTopBar = true
//        let DownloadNav = UINavigationController(rootViewController: DownloadVC)
//        DownloadNav.isNavigationBarHidden = true
//        var downloadDict : [String:Any] = [:]
//        downloadDict["file"] = DownloadNav
//        downloadDict["selected"] = ThemeManager.currentTheme().tabBarBottomDownloadImageSel
//        downloadDict["unselected"] = ThemeManager.currentTheme().tabBarBottomDownloadImage
//        downloadDict["title"] = LabelText.download.localized
//        let DownloadNavObj = tabObjects.init(fromDictionary: downloadDict)
//        //-tabBarObjects.append(DownloadNavObj)
//
//        let ComingsoonVC = ComingSoonVC()//DownloadsVC() //StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "DownloadsVC") as! DownloadsVC
//       // DownloadVC.hideTopBar = true
//        let ComingSoonNav = UINavigationController(rootViewController: ComingsoonVC)
//        ComingSoonNav.isNavigationBarHidden = true
//        var ComingSoonDict : [String:Any] = [:]
//        ComingSoonDict["file"] = ComingSoonNav
//        ComingSoonDict["selected"] = #imageLiteral(resourceName: "Coming_Soon_Selected")
//        ComingSoonDict["unselected"] = #imageLiteral(resourceName: "Coming_Soon_Unselected")
//        ComingSoonDict["title"] = LabelText.coming_soon.localized//"Coming Soon"//LabelText.download.localized//"My List"
//        let ComingSoonNavObj = tabObjects.init(fromDictionary: ComingSoonDict)
//
//        if ThemeManager.currentTheme() == .Normal {
//            tabBarObjects.append(homeObj)
//            tabBarObjects.append(searchObj)
//            tabBarObjects.append(liveObj)
//            tabBarObjects.append(ComingSoonNavObj)
//
//            if UserManager.shared.isUserLoggedIn() {
//                if UserManager.shared.userRegion == "IN" && UserManager.shared.userModel.samzoDisable == false {
//                    let EpicVC = MyEpicoinsVC()//StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "MyEpicoinsMainVC") as! MyEpicoinsMainVC
//                    let EpicNav = UINavigationController(rootViewController: EpicVC)
//                    EpicNav.isNavigationBarHidden = true
//                    var epicDict : [String:Any] = [:]
//                    epicDict["file"] = EpicNav
//                    epicDict["selected"] = #imageLiteral(resourceName: "EpiCoin_selected")
//                    epicDict["unselected"] = #imageLiteral(resourceName: "EpiCoin_unselected") //.withTintColor(APPCOLORS.BOTTOMBAR_UNSELECTED.toColor())
//                    epicDict["title"] = LabelText.reward_store.localized//"Offers"
//                    let epicObj = tabObjects.init(fromDictionary: epicDict)
//                    tabBarObjects.append(epicObj)
//                } else {
//                    //                let NotiVC = StoryBoards.Main.getStoryBoard().instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
//                    //                let NotiNav = UINavigationController(rootViewController: NotiVC)
//                    //                NotiNav.isNavigationBarHidden = true
//                    //                var notiDict : [String:Any] = [:]
//                    //                notiDict["file"] = NotiNav
//                    //                notiDict["selected"] = #imageLiteral(resourceName: "Notification_selected")
//                    //                notiDict["unselected"] = #imageLiteral(resourceName: "Notification_unselected")
//                    //                notiDict["title"] = LabelText.notification.localized//"Notification"
//                    //                let notiObj = tabObjects.init(fromDictionary: notiDict)
//                    //                tabBarObjects.append(notiObj)
//                    tabBarObjects.append(DownloadNavObj)
//                }
//            } else {
//
//            }
//
//
//        } else {
//            tabBarObjects.append(homeObj)
//            tabBarObjects.append(searchObj)
//            tabBarObjects.append(DownloadNavObj)
//        }
//
//
//
//
//
//        //        let controllerArray = [homeNav, searchNav, LiveNav, MyListNav, NotiNav]
//        self.viewControllers = tabBarObjects.map({
//            $0.navController
//        })
//
//
//        self.tabBar.backgroundImage = ThemeManager.currentTheme().tabBarBackgroundImage
//
//        if let count = self.tabBar.items?.count {
//            for i in 0...(count-1) {
//                if #available(iOS 13.0, *) {
//                    self.tabBar.items?[i].imageInsets = UIEdgeInsets(top: 05, left: 05, bottom: 05, right: 05)
//                }
//                self.tabBar.items?[i].selectedImage = tabBarObjects[i].selectedImage.withRenderingMode(.alwaysOriginal)
//                self.tabBar.items?[i].image = tabBarObjects[i].unSelectedImage.withRenderingMode(.alwaysOriginal)
//                self.tabBar.items?[i].title = tabBarObjects[i].title
//
//
//                if ThemeManager.currentTheme() == .Kids {
//                    self.tabBar.items?[i].setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font:UIFont(name: "Hey Comic", size: 12) as Any], for: .selected)
//
//                    self.tabBar.items?[i].setTitleTextAttributes([NSAttributedString.Key.foregroundColor : APPCOLORS.GRAYKIDS.toColor(), NSAttributedString.Key.font:UIFont(name: "Hey Comic", size: 12) as Any], for: .normal)
//                }else{
//                    self.tabBar.items?[i].setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
//                    self.tabBar.items?[i].setTitleTextAttributes([NSAttributedString.Key.foregroundColor: APPCOLORS.GRAYKIDS.toColor()], for: .normal)
//                }
//
//            }
//        }
//
//
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: APPCOLORS.BUTTON_UNSELECTED.toColor()], for: .normal)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //print(tabBar.selectedItem)

        print("Currently selected Index: ", selectedIndex)
    }

    // MARK: - Internal methods for Mini Cast


    func installViewController(_ viewController: UIViewController?, inContainerView containerView: UIView) {
      if let viewController = viewController {
        addChild(viewController)
        viewController.view.frame = containerView.bounds
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
      }
    }

    func uninstallViewController(_ viewController: UIViewController) {
      viewController.willMove(toParent: nil)
      viewController.view.removeFromSuperview()
      viewController.removeFromParent()
    }
    
    // MARK: - GCKUIMiniMediaControlsViewControllerDelegate


}


extension EpicTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if tabBarController.selectedIndex == 3 {//|| (tabBarController.selectedIndex == 4 && UserManager.shared.userRegion == "IN"){
//            if !UserManager.shared.isUserLoggedIn(){
              // goToLogin()
//                tabBarController.selectedIndex = 0
//                showLoginPopUp()
//            }
//        }
       // var dic = UserManager.shared.userData
       
        if (selectedIndex < tabBarObjects.count){
         //   dic["itemName"] = tabBarObjects[selectedIndex].title
        }
      
        //in case of account and home Trigger the CT Events
        if tabBarController.selectedIndex == 0 { //|| tabBarController.selectedIndex == 3{
//            let event = ctEventTabDictionay[tabBarController.selectedIndex]!
//            CleverTapManager.shared.recordEvent(withEvent: event, andData:  UserManager.shared.userData)
            tabClicked?()
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if let items = self.tabBar.items, tabBarObjects.count != items.count {
            //if let tabBarController = self.tabBarController {

                let indexToRemove = items.count - 1
                var viewControllers = self.viewControllers
                viewControllers?.remove(at: indexToRemove)
                self.viewControllers = viewControllers
            //}
        }
    }
}

class tabObjects: NSObject {

    var navController : UINavigationController!
    var selectedImage : UIImage!
    var unSelectedImage : UIImage!
    var title: String!

    init(fromDictionary dictionary: [String:Any]){
        navController = dictionary["file"] as? UINavigationController
        selectedImage = dictionary["selected"] as? UIImage
        unSelectedImage = dictionary["unselected"] as? UIImage
        title = dictionary["title"] as? String
    }

    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if navController != nil {
            dictionary["file"] = navController
        }
        if selectedImage != nil {
            dictionary["selected"] = selectedImage
        }
        if unSelectedImage != nil {
            dictionary["unselected"] = unSelectedImage
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }


}

