//
//  AdditionalDetailsTableViewCell.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import UIKit

class AdditionalDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var descriptionValueLabel: UILabel!
    
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var referenceValueLabel: UILabel!
    @IBOutlet weak var paymentMethodValueLabel: UILabel!
    @IBOutlet weak var balanceValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        baseView.applyCornerRadius(cornerRadius: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureAdditionalTransactionInfoCell(transactionAdditionalData: [[String: String]]){
        print(transactionAdditionalData)
        for info in transactionAdditionalData {
            if let description = info["Description"] {
                descriptionValueLabel.text = description
            }
            if let balance = info["Balance After Transaction"] {
                balanceValueLabel.text = balance
            }
            if let PaymentMethod = info["Payment Method"] {
                paymentMethodValueLabel.text = PaymentMethod
            }
            if let reference = info["Reference"] {
                referenceValueLabel.text = reference
            }
            if let account = info["Account"] {
                accountNumberLabel.text = account
            }
        }
    }
}
