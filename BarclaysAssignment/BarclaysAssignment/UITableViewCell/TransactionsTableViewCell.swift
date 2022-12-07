//
//  TransactionsTableViewCell.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 05/12/22.
//
enum Color: String {
   case red
   case Green
   case black
    case blue

    var create: UIColor {
       switch self {
          case .red:
            return UIColor.red
          case .Green:
            return UIColor.green
          case .black:
           return UIColor.black
       case .blue:
           return UIColor.blue
       }
    }
  }

import UIKit

class TransactionsTableViewCell: UITableViewCell {

    @IBOutlet weak var roundedLabelLogo: UILabel!
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var balanceAmountLabel: UILabel!
  
    class var identifier: String { return String(describing: self) }
        class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()
       initView()
    }
    
    func initView() {
           // Cell view customization
        backgroundColor = .clear
        roundedLabelLogo.makeRoundedLabel()

           // Line separator full width
           preservesSuperviewLayoutMargins = false
           separatorInset = UIEdgeInsets.zero
           layoutMargins = UIEdgeInsets.zero
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
        headingLabel.text = nil
        balanceAmountLabel.text = nil
        }
    
    func configureTransactionCell(transactionGroup: TransactionGroups) {
        headingLabel.text = transactionGroup.transactions[0].heading
        balanceAmountLabel.text = transactionGroup.transactions[0].amount
        setLogoColor(color: transactionGroup.transactions[0].categoryColour)
        setLogoText(text: transactionGroup.transactions[0].heading)
    }
    
    func setLogoColor(color: String) {
        if let color = Color(rawValue: color){
            roundedLabelLogo.backgroundColor = color.create
        }
    }
    
    func setLogoText(text: String) {
        let firstLetter = text.first
        if let firstLetter {
            roundedLabelLogo.text = "\(firstLetter)"
        }
    }
}
