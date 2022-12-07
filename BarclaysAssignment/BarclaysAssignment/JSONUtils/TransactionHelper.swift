//
//  TransactionHelper.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//


import Foundation
// MARK: - Helper methods for reading the JSON file.

/// Method to read the local json file.
/// - Parameter name: file name
/// - Returns: return file contents in Data format.
class jsonHandler {
    func readLocalJSONFile(forName name: String, forType fileType: String, completion: (Bool,Data?)->()){
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: fileType) {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                completion(true,data)
            }
        } catch {
            print("error: \(error)")
            completion(false,nil)
        }

    }
}

