//
//  AppUtility.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/28/21.
//

import UIKit

class AppUtility: NSObject {

    class func getScreenHeight() -> CGFloat
    {
        return UIScreen.main.bounds.height
    }
    
    class func getScreenWidth() -> CGFloat
    {
        return UIScreen.main.bounds.width
    }
    
    class func setCornerRadius( _ view:AnyObject, radius:CGFloat)
    {
        (view as? UIView)!.layer.borderColor = UIColor.lightGray.cgColor
        (view as? UIView)!.layer.borderWidth = 0
        (view as? UIView)!.layer.cornerRadius = radius
        (view as? UIView)!.layer.masksToBounds = true
    }
    
    class func setBorderWithColor(_ textField:AnyObject, borderColor: UIColor, borderSize:CGFloat)
    {
        (textField as? UIView)!.layer.borderWidth = borderSize
        (textField as? UIView)!.layer.borderColor = borderColor.cgColor
    }
    
    class func setShadow( _ view:AnyObject,opacity:Float, radius:CGFloat)
    {
        (view as? UIView)!.layer.shadowColor = UIColor.darkGray.cgColor
        (view as? UIView)!.layer.shadowOpacity = opacity
        //(view as? UIView)!.layer.shadowOffset = CGSize.zero
        (view as? UIView)!.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        (view as? UIView)!.layer.shadowRadius = radius
        (view as? UIView)!.layer.masksToBounds = true
        (view as? UIView)!.clipsToBounds = true
    }
    
    class func setPaddingView(_ textField:UITextField, width:CGFloat)
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightView = paddingView
        textField.rightViewMode = UITextField.ViewMode.always
    }
    
    class func getTitleLblWithText(_ title:String,color :UIColor) -> UILabel {
    
        let titleLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 170.0, height: 30.0))
        titleLbl.backgroundColor = .clear
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont(name: "sans-serif", size: 17)!
        titleLbl.text = title
        titleLbl.textColor = color
        return titleLbl
    }
    
    class func getTitleLblWithText(_ title:String,color :UIColor,font :UIFont) -> UILabel {
        
        let titleLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 170.0, height: 30.0))
        titleLbl.backgroundColor = .clear //UIColor.darkGray
        titleLbl.textAlignment = .center
        titleLbl.font = font
        titleLbl.text = title
        titleLbl.textColor = color
        return titleLbl
    }
    
    class  func isIpad() -> Bool {
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
        {
            return true
        }
        return false
    }
    
    class  func isIphone4() -> Bool {
        if (self.getScreenHeight() == 480)
        {
            return true
        }
        return false
    }
    
    
    class  func isIphone5() -> Bool {
        if (self.getScreenHeight() == 568)
        {
            return true
        }
        return false
    }
    
    class  func isIphone6() -> Bool {
        if (self.getScreenHeight() == 667)
        {
            return true
        }
        return false
    }
    
    class  func isIphone6P() -> Bool {
        if (self.getScreenHeight() >= 736)
        {
            return true
        }
        return false
    }
    
    class func isValidEmail(_ checkString: String) -> Bool {
//        let stricterFilter = false
//        let stricterFilterString = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let laxString = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailRegex: String = laxString//stricterFilter ? stricterFilterString : laxString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: checkString)
    }
    
    
}

