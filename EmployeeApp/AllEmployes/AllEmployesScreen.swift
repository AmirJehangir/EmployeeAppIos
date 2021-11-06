//
//  AllEmployesScreen.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 09/08/2021.
//

import Foundation


import UIKit
import Alamofire


class AllEmployesScreen : UIViewController,UITableViewDataSource,UITableViewDelegate,EmployeeProtocols,AddEmployeeProtocols{
    
    
    @IBOutlet var tableView: UITableView!
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "AllEmpTableViewCell"
    
    var allEmployeeDataList : [EmployeeDataModel]? = []
    
    override func viewDidLoad() {
        
        
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "EmployeesList", comment: "")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addNewEmployeesScreen))
        
        
        self.tableView.register(AllEmpTableViewCell.nib(), forCellReuseIdentifier:AllEmpTableViewCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    
        getEmpDataFromService()
    }
    
    
    func getEmpDataFromService(){
        let request = AF.request("http://dummy.restapiexample.com/api/v1/employees")
        // 2
        request.responseDecodable(of: EmployeeResponseModel.self) { (datam) in
            
            guard let empData = datam.value else {return}
            
            
            self.allEmployeeDataList = empData.data
            
            print(empData.data)
            self.populateEmpList(allEmpData: self.allEmployeeDataList)
        }
    }
    
    
    
    func populateEmpList(allEmpData : [EmployeeDataModel]?)  {
        
        tableView.reloadData()
       
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AllEmpTableViewCell.identifier,for: indexPath) as! AllEmpTableViewCell
        
        cell.updateCell(with: allEmployeeDataList?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
//        if let allData = allEmpData{
//            return allData.data.count
//        }else{
//            return 0
//        }
        
        
        guard let allData = allEmployeeDataList  else {
            return 0
        }
        return allData.count
        
       
       
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let allEmpDataList  = allEmployeeDataList{
            openEmpDetailScreen(empData: allEmpDataList[indexPath.row])
        }

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.allEmployeeDataList?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    
    func openEmpDetailScreen(empData : EmployeeDataModel?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "EmployeeDetailScreen") as! EmployeeDetailScreen
        controller.employeeData = empData
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: false)
    }
    
    
    func updateEmployee(employeeDataModel: EmployeeDataModel) {
    
        if let row = self.allEmployeeDataList?.firstIndex(where: {$0.id
                                                            == employeeDataModel.id
        }) {
            self.allEmployeeDataList?[row] = employeeDataModel
            
            tableView.reloadData()
        }
        
    }
    
    func deleteEmployee(employeeDataModel: EmployeeDataModel) {
        if let row = self.allEmployeeDataList?.firstIndex(where: {$0.id
                                                            == employeeDataModel.id
        }) {
            self.allEmployeeDataList?.remove(at: row)
            
            tableView.reloadData()
        }
    }
    
    
    func updateEmpService() {
        let request = AF.request("http://dummy.restapiexample.com/api/v1/employees")
        // 2
        request.responseDecodable(of: EmployeeResponseModel.self) { (datam) in
            
            guard let empData = datam.value else {return}
            
            
            self.allEmployeeDataList = empData.data
            
            print(empData.data)
            self.populateEmpList(allEmpData: self.allEmployeeDataList)
        }
    }
    
    func deleteEmpService() {
        
    }
    
    
    func addEmployee(employeeDataModel : EmployeeDataModel) {
        self.allEmployeeDataList?.append(employeeDataModel)
        tableView.reloadData()
        let abc = employeeDataModel
        addEmpFromService(mployeeDataModel : abc)
    }
    
    func addEmpFromService(mployeeDataModel: EmployeeDataModel) {
        let request = AF.request("http://dummy.restapiexample.com/api/v1/create" , method: .post,parameters: mployeeDataModel)
        // 2
        request.responseDecodable(of: EmployeeResponseModel.self) { (datam) in
            
            guard let empData = datam.value else {return}
            
            
//            self.allEmployeeDataList = empData.data
//
//            print(empData.data)
//            self.populateEmpList(allEmpData: self.allEmployeeDataList)
        }
    }
    
    
    @IBAction
    func addNewEmployeesScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "AddNewEmpScreen") as! AddNewEmpScreen
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: false)
    }
    
}
