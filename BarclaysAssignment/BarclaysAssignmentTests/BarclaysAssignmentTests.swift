//
//  BarclaysAssignmentTests.swift
//  BarclaysAssignmentTests
//
//  Created by Bhavana R. Kamble on 05/12/22.
//

import XCTest
@testable import BarclaysAssignment

final class BarclaysAssignmentTests: XCTestCase {
    
    var transactionsTableViewCell = TransactionsTableViewCell()
    var transactionGroup : [TransactionGroups] = [TransactionGroups]()
   
    override func setUpWithError() throws {
        guard let path = Bundle.main.path(forResource: "Transactions", ofType: "json")
                else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decodedData = try JSONDecoder().decode(TransactionArrayModel.self, from: data)
            transactionGroup = decodedData.transactionGroups
        }catch{
            print("error")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_GetResponse_ReturnTrue() {
        XCTAssertNotNil(transactionGroup)
        XCTAssertEqual(transactionGroup.count, 3)
    }
    
    func test_CheckCategoryColor() {
        XCTAssertNotNil(transactionGroup[0].transactions[0].categoryColour)
        XCTAssertEqual(transactionGroup[0].transactions[0].categoryColour, "black")
    }
    
    func test_getFirstLetter() {
        let letter = transactionGroup[0].transactions[0].heading.first
       XCTAssertEqual(letter, "A")
    }
}

