//
//  BaseViewController.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 19/08/2021.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
    
    
    
    @objc
    func changeLanguage(identity:String) {
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                    LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                } else {
                    LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
                    UIView.appearance().semanticContentAttribute = .forceRightToLeft
                }
                
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "navclass") as! UINavigationController
                let appDlg = UIApplication.shared.delegate as? AppDelegate
                appDlg?.window?.rootViewController = vc
    }
    
}
