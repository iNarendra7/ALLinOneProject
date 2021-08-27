//
//  APP_THEME.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/27/21.
//

import Foundation
import UIKit

extension UIColor {
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
enum Theme: Int {

    case Normal, Kids

    var mainColor: UIColor {
        switch self {
        case .Normal:
            return UIColor().colorFromHexString("ffffff")
        case .Kids:
            return UIColor().colorFromHexString("000000")
        }
    }

    //Customizing the Navigation Bar
    var barStyle: UIBarStyle {
        switch self {
        case .Normal:
            return .default
        case .Kids:
            return .black
        }
    }

    var navigationBackgroundImage: UIImage? {
        return self == .Normal ? UIImage(named: "navBackground") : nil
    }

    var tabBarBackgroundImage: UIImage? {
        return self == .Normal ? UIImage(named: "tabBarBackground") : UIImage(named: "tabBarBackground_kids")
    }
    var backgroundImage: UIImage? {
        return self == .Normal ? UIImage(named: "Background") : UIImage(named: "kids_bg")
    }

    var tabBarBottomHomeImage: UIImage? {
        return self == .Normal ? UIImage(named: "Home_unselected") : UIImage(named: "Home_unselected_kids")
    }
    var tabBarBottomHomeImageSel: UIImage? {
        return self == .Normal ? UIImage(named: "Home_selected") : UIImage(named: "Home_selected_kids")
    }
    var tabBarBottomSearchImage: UIImage? {
        return self == .Normal ? UIImage(named: "Search_unselected") : UIImage(named: "Search_unselected_kids")
    }
    var tabBarBottomSearchImageSel: UIImage? {
        return self == .Normal ? UIImage(named: "Search_selected") : UIImage(named: "Search_selected_kids")
    }
    var tabBarBottomDownloadImage: UIImage? {
        return self == .Normal ? UIImage(named: "MyList_unselected") : UIImage(named: "download_unselected_kids")
    }
    var tabBarBottomDownloadImageSel: UIImage? {
        return self == .Normal ? UIImage(named: "MyList_selected") : UIImage(named: "download_selected_kids")
    }
    
    var accessoryViewBG_kid: UIImage? {
        return self == .Kids ? UIImage(named: "AccessoryViewBG_kid") : nil
    }
    
    var epicOnLogo: UIImage? {
        return self == .Normal ? UIImage(named: "Logo_EpicOn") : UIImage(named: "epiconLogo_kids")
    }
    var homeKidsLogo: UIImage? {
        return self == .Kids ? UIImage(named: "kids_logoTop") : nil
    }
    
    
    
    var backgroundColor: UIColor {
        switch self {
        case .Normal:
            return UIColor().colorFromHexString("300820")
        case .Kids:
            return UIColor().colorFromHexString("480557")
        }
    }

    var secondaryColor: UIColor {
        switch self {
        case .Normal:
            return UIColor().colorFromHexString("300820")
        case .Kids:
            return UIColor().colorFromHexString("230536")
        }
    }
    
    var titleFont_watch: UIFont {
        switch self {
        case .Normal:
            return UIFont(name:"OpenSans-SemiBold",size:20)!
        case .Kids:
            return UIFont(name:"Hey Comic",size:20)!
        }
    }
    
    var titleFont_listen: UIFont {
        switch self {
        case .Normal:
            return UIFont(name:"OpenSans-SemiBold",size:16)!
        case .Kids:
            return UIFont(name:"Hey Comic",size:16)!
        }
    }
    
    var titleFont_tray: UIFont {
        switch self {
        case .Normal:
            return UIFont(name:"OpenSans-SemiBold",size:16)!
        case .Kids:
            return UIFont(name:"Hey Comic",size:16)!
        }
    }
    
    var subtitleTextColor: UIColor {
        switch self {
        case .Normal:
            return UIColor().colorFromHexString("ffffff")
        case .Kids:
            return UIColor().colorFromHexString("000000")
        }
    }
    
}

// Enum declaration
let SelectedThemeKey = "SelectedTheme"

// This will let you use a theme in the app.
class ThemeManager {

    // ThemeManager
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .Normal
        }
    }

    static func applyTheme(theme: Theme) {
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()

        
    }
}
