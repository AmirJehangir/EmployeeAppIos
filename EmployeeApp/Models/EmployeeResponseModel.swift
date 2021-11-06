//
//  AllEmpModel.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 10/08/2021.
//

import Foundation

struct EmployeeResponseModel: Codable {
    let status: String
    var data: [EmployeeDataModel]
    let message: String
}

// MARK: - Datum
struct EmployeeDataModel: Codable {
    var id: Int
    var employeeName: String
    var employeeSalary, employeeAge: Double
    var profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
