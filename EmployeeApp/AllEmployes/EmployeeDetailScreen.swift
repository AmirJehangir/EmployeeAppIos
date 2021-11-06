//
//  EmployeeDetailScreen.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 10/08/2021.
//

import Foundation

import UIKit




class EmployeeDetailScreen : BaseViewController {
    
    @IBOutlet var empNamelbl : UITextField!
    @IBOutlet var empSalarylbl : UITextField!
    @IBOutlet var empAgelbl : UITextField!
    @IBOutlet var empUpdateButton : UIButton!
    
    var employeeData : EmployeeDataModel?
    var empUpdateData : EmployeeDataModel?
    var delegate  : EmployeeProtocols?
    
    override func viewDidLoad() {
        
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "EmployeeDetails", comment: "")
        
        empUpdateButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Update", comment: ""), for: .normal)
        
        self.empNamelbl.text = employeeData?.employeeName ?? ""
        let eSalary = employeeData?.employeeSalary ?? 0
        self.empSalarylbl.text = String(eSalary)
        let eAge = employeeData?.employeeAge ?? 0
        self.empAgelbl.text = String(eAge)
    
    }
    
    
    
    @IBAction
    func cancelButton() {
        
        delegate?.deleteEmployee(employeeDataModel: employeeData!)
        
//        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
       
        
    }
    
  
    
    
    @IBAction
    func updateEmpButton() {
        
        
        let empAgeData = self.empAgelbl.text ?? "0"
        let empSalaryData = self.empSalarylbl.text ?? "0"
        let empAge  = empAgeData
        let empSalary  = empSalaryData
        employeeData?.employeeAge =  Double(empAge) ?? 0.0
        employeeData?.employeeSalary = Double(empSalary) ?? 0.0
        employeeData?.employeeName = self.empNamelbl.text ?? "null"
        
        empUpdateData = employeeData
        
        
        delegate?.updateEmployee(employeeDataModel: empUpdateData!)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    
}
