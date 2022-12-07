//
//  Handler.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 07/12/22.

// Follow SRP here (every class has single responibility)

import Foundation
class Handler {
    let jsonHandler: jsonHandler
    let parseHandler: transactionGroupParse
    
    init(jsonHandler: jsonHandler, parseHandler: transactionGroupParse) {
        self.jsonHandler = jsonHandler
        self.parseHandler = parseHandler
    }
    func handlerForTransactionResponse(fileName: String, fileType: String, completion: @escaping (Bool, TransactionArrayModel?, String?) -> ()) {
        jsonHandler.readLocalJSONFile(forName: fileName, forType: fileType) { success, data in
            if success {
                    if let data = data {
                        let decodedData = parseHandler.requestToParse(jsonData: data)
                        completion(true, decodedData, nil)
                    }
            } else {
                print("error")
            }
        }
    }
}
