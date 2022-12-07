//
//  Transaction.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import Foundation

struct TransactionArrayModel : Codable{
    var transactionGroups: [TransactionGroups]
}

struct TransactionGroups:Codable {
    var label: String
    var transactions: [TransactionData]
    enum CodingKeys: String, CodingKey {
        case label
        case transactions
    }
}


struct TransactionData:Codable {
    var heading: String
    var amount: String
    var categoryColour: String
    var additionalDetails: [[String: String]]

    enum CodingKeys: String, CodingKey {
        case heading
        case amount
        case categoryColour
        case additionalDetails
    }
}

struct AdditionalTransactionDetails: Codable {
    var Description: String
    //var BalanceAfterTransaction: String
    var PaymentMethod: String
    var Reference: String
    var Account: String
    
    enum CodingKeys: String, CodingKey {
            case Description
           // case BalanceAfterTransaction = "Balance After Transaction"
            case PaymentMethod = "Payment Method"
            case Reference
            case Account
        }
}
