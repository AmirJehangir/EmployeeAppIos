//
//  AllEmpTableViewCell.swift
//  EmployeeApp
//
//  Created by Amir Jehangir on 10/08/2021.
//

import UIKit

class AllEmpTableViewCell: UITableViewCell {
    
    
    static  var identifier = "AllEmpTableViewCell"
    
    @IBOutlet var tvEmpName : UILabel!
    @IBOutlet var tvEmpSalary : UILabel!
    @IBOutlet var tvEmpAge : UILabel!
    
    var empNameTitle : String?
    
    static func nib() -> UINib{
        
        return UINib(nibName: "AllEmpTableViewCell", bundle: nil)
    }
    
    
    func updateCell(with titleM : EmployeeDataModel?) {
//        empNameTitle = titleM
        tvEmpName.text = titleM?.employeeName ?? ""
        let empsla = titleM?.employeeSalary ?? 0
        tvEmpSalary.text = String(empsla)
        let empage = titleM?.employeeAge ?? 0
        tvEmpAge.text = String(empage)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
