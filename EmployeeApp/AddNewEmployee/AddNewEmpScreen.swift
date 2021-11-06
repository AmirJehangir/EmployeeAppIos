//
//  AddNewEmpScreen.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 14/08/2021.
//

import Foundation
import UIKit
class AddNewEmpScreen: UIViewController{
  
    
    
    
    @IBOutlet
    var empName : UITextField!,
     empAge : UITextField!,
     empSalary : UITextField!
    
    @IBOutlet
    var empNamelbl : UILabel!,
        empSalarylbl : UILabel!,
        empAgelbl : UILabel!
    
    var newEmpData : EmployeeDataModel?
    var delegate  : AddEmployeeProtocols?
    
    override func viewDidLoad() {
        
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "AddNewEmployee", comment: "")
        
        empNamelbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "EmpName", comment: "")
        empSalarylbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "EmpSalary", comment: "")
        empAgelbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "EmpAge", comment: "")
    }
    
    
    
    @IBAction
    func addNewEmp() {
        
        
        let empData = EmployeeDataModel(id: 0,employeeName: empName.text ?? "",employeeSalary:  Double(empSalary.text ?? "0") ?? 0.0 ,employeeAge: Double(empAge.text ?? "0") ?? 0.0,profileImage: "")
      
        
        delegate?.addEmployee(employeeDataModel: empData)
        self.navigationController?.popViewController(animated: true)
    }

    
    
}
