//
//  tableListTableViewCell.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

protocol makeButtonClickableProtocol {
    func actionOnButtonClick(index:Int)
    func actionOnViewButtonClick(email:String)
}

class tableListTableViewCell: UITableViewCell {
    
    //make a variable of protocal
    var cellDelegate:makeButtonClickableProtocol?
    var index:Int?
    var email:String?
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    @IBAction func deleteCell(_ sender: UIButton) {
        //print("in deleete")
        cellDelegate?.actionOnButtonClick(index: index!)
    }
    @IBAction func viewCell(_ sender: Any) {
        print("in view")
        cellDelegate?.actionOnViewButtonClick(email: email!)
    }
    
}
