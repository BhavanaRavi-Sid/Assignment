//
//  TransactionDetailsViewController.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import UIKit

class TransactionDetailsViewController: UIViewController {

    var transactionDetails: TransactionGroups?
    
    @IBOutlet weak var headerUIview: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var roundedLabelLogo: UILabel!

    @IBOutlet weak var additionalInfoTableView: UITableView!{
        didSet {
            additionalInfoTableView.delegate   = self
            additionalInfoTableView.dataSource = self
            additionalInfoTableView.tableFooterView = UIView()
            additionalInfoTableView.allowsSelection = true
            additionalInfoTableView.register(UINib.init(nibName:"AdditionalDetailsTableViewCell", bundle:nil), forCellReuseIdentifier:"AdditionalDetailsTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transaction Detail"
        // Do any additional setup after loading the view.
        refreshUI()
    }
    
    func refreshUI(){
        roundedLabelLogo.makeRoundedLabel()
        headerUIview.applyCornerRadius(cornerRadius: 8)
        if let transactionDetails {
            headingLabel.text = transactionDetails.transactions[0].heading
            amountLabel.text = transactionDetails.transactions[0].amount
            setLogoColor(color: transactionDetails.transactions[0].categoryColour)
            setLogoText(text: transactionDetails.transactions[0].heading)
        }
    }
   
    func setLogoColor(color: String) {
        if let color = Color(rawValue: color){
            print(color)
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


extension TransactionDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactionDetails?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"AdditionalDetailsTableViewCell") as? AdditionalDetailsTableViewCell
        if let transactionDetails {
            cell?.configureAdditionalTransactionInfoCell(transactionAdditionalData: transactionDetails.transactions[indexPath.row].additionalDetails)
        }
        return cell ?? TransactionsTableViewCell()
    }
}
