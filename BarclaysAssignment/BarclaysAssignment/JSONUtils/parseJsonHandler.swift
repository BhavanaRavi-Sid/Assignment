//
//  parseJsonHandler.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 07/12/22.
//


//Here I used SOLID principle: Open and closed principle

import Foundation
class parseJsonHandler<T: Decodable> {
    /// Parse the jsonData using the JSONDecoder 
    /// - Parameter jsonData: jsonData object
    func requestToParse(jsonData: Data) -> T? {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
typealias transactionGroupParse = parseJsonHandler<TransactionArrayModel>
