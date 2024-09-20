//
//  UserDetailsTableViewCell.swift
//  TestAply
//
//  Created by Kishore B on 9/20/24.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {

    // 
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var geoLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(with data: UserDetails) {
        self.idLabel.text = "id: \(data.id ?? 0)"
        self.nameLabel.text = "Name: \(data.username ?? "")"
        self.mobileNumberLabel.text = "Mobile Number: \(hidePhoneNumber(data.phone ?? ""))"
        self.geoLabel.text = "lat lng: \(data.address?.geo?.lat ?? "") \( data.address?.geo?.lng ?? "")"
    }

    func hidePhoneNumber(_ input: String) -> String {
        let digitsOnly = input.filter { $0.isNumber }
        
        var hiddenPart = ""
        
        for i in 0..<digitsOnly.count {
            if i < digitsOnly.count - 4 {
                hiddenPart.append("*")
            } else {
                hiddenPart.append(digitsOnly[digitsOnly.index(digitsOnly.startIndex, offsetBy: i)])
            }
        }
        
        return hiddenPart
    }

}
