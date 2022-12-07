//
//  TransactionListViewController.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import UIKit

class TransactionListViewController: UIViewController {
    //Constant
    let heightForTableViewCell: CGFloat = 60
 
    @IBOutlet weak var transactionTableView: UITableView!{
        didSet {
            transactionTableView.delegate   = self
            transactionTableView.dataSource = self
            transactionTableView.separatorStyle = .none
            transactionTableView.separatorStyle = .singleLine
            transactionTableView.tableFooterView = UIView()
            transactionTableView.allowsSelection = true
            transactionTableView.register(UINib.init(nibName:"TransactionsTableViewCell", bundle:nil), forCellReuseIdentifier:"TransactionsTableViewCell")
        }
    }
    var transactionModel: [TransactionData]?
    var transactionVM : TransactionListViewModel = TransactionListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        transactionTableView.reloadData()
    }
    
    func initViewModel() {
        transactionVM.getDataFromJson()
        
    }
}

extension TransactionListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForTableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionVM.transactionGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"TransactionsTableViewCell") as? TransactionsTableViewCell
        cell?.configureTransactionCell(transactionGroup: transactionVM.transactionGroup[indexPath.row])
        return cell ?? TransactionsTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTransaction(transactionGroup: transactionVM.transactionGroup[indexPath.row])
    }
}

extension TransactionListViewController{
    func selectTransaction(transactionGroup: TransactionGroups) {
        ScreenManager.sharedScreenManager.pushTransactionDetailsViewController(vc: self, transactionDetails: transactionGroup)
    }
}
