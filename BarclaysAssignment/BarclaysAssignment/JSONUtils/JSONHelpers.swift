//
//  ParseJson.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import Foundation

class JSONHelpers {
    
    func readData(resource: String, fileType: String, complete: @escaping (Bool, Data?) -> ()) {
        do {
                if let filePath = Bundle.main.path(forResource: resource, ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let data = try Data(contentsOf: fileUrl)
                     print(data)
                }
            } catch {
                print("error: \(error)")
            }
        
        
        
        
        do {
                    if let file = Bundle.main.url(forResource: resource, withExtension: fileType) {
                        let data = try Data(contentsOf: file)
                        let decoder = JSONDecoder()
                        let person = try? decoder.decode([TransactionGroups].self, from: data)
                        print(person)
                        complete(true, data)
                    }
                } catch {
                    print(error.localizedDescription)
                    complete(false, nil)
                }
    }
}
