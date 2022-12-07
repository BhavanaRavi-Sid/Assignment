//
//  ScreenManager.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import Foundation
import UIKit

class ScreenManager:NSObject {
    
    @objc static let sharedScreenManager = ScreenManager()
    
    private override init() {}
    
    func pushTransactionDetailsViewController(vc: UIViewController, transactionDetails: TransactionGroups) {
        if let detailVC = vc.storyboard?.instantiateViewController(withIdentifier: "TransactionDetailsViewController") as? TransactionDetailsViewController {
            detailVC.transactionDetails = transactionDetails
            vc.navigationController?.pushViewController(detailVC, animated: true)
        }

    }
}
