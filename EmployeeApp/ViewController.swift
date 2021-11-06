//
//  ViewController.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 08/08/2021.
//

import UIKit
import SideMenu
import Alamofire

class ViewController: BaseViewController {
    
    @IBOutlet var edUserName : UITextField!
    @IBOutlet var edPassword: UITextField!
    
    @IBOutlet var loginuserButton : UIButton!
    @IBOutlet var lblUsername : UILabel!
    @IBOutlet var lblPassword : UILabel!
    
    @IBOutlet var btnCancel : UIButton!
    
    var userName = ""
    var password = ""
    
    var menu : SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.openMenu))
        
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide =  true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        SideMenuManager.default.leftMenuNavigationController = menu
        
        
        
    
        lblUsername.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Username", comment: "")
            lblPassword.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Password", comment: "")
        
        
        btnCancel.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "changelanguage", comment: ""), for: .normal)
        
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "EmployeesList", comment: "")
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction
    func btnChangeLanguage() {
        
        
//        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
//                    LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
//                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
//                } else {
//                    LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
//                    UIView.appearance().semanticContentAttribute = .forceRightToLeft
//                }
//
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "navclass") as! UINavigationController
//                let appDlg = UIApplication.shared.delegate as? AppDelegate
//                appDlg?.window?.rootViewController = vc
        
        
        self.changeLanguage(identity: "")
        
    }
    
    //
    @IBAction
    func loginUserButton() {
        
        loginCreditional(username_:edUserName.text,password_:edPassword.text)
    }
    
    
    func loginCreditional(username_ : String?,password_ : String?) {
        
        
//        userName = username_ ?? ""
//        password =  password_ ?? ""
//
//        if(!userName.isEmpty && !password.isEmpty){
//
//            openEmployeesScreen()
//        }
        
        
        openEmployeesScreen()
    }
    
    
    
    func openEmployeesScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "AllEmployesScreen") as! AllEmployesScreen
        navigationController?.pushViewController(controller, animated: false)
    }
    
    @objc
    func openMenu(){
        present(menu!, animated: true)
    }


}
class MenuListController: UITableViewController{
    
    var menuList = ["abcf","erqewrq","asdfas","hkbhbhkbk","qwert"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath.row)
    }
}

