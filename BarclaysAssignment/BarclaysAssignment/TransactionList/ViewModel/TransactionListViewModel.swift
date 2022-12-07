//
//  TransactionListViewModel.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import Foundation

class TransactionListViewModel {
    
    var transactionGroup : [TransactionGroups] = [TransactionGroups]()
    var handler: Handler?
    
    func getDataFromJson() {
        handler = Handler(jsonHandler: jsonHandler(), parseHandler: parseJsonHandler())
      
        handler?.handlerForTransactionResponse(fileName: "Transactions", fileType: "json", completion: { success, results, error in
            if success {
                if let results {
                    self.transactionGroup = results.transactionGroups}
            } else {
                print("error")
            }
            })
    }
}
