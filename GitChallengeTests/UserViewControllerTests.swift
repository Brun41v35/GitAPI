//
//  UserViewControllerTests.swift
//  GitChallengeTests
//
//  Created by Bruno Silva on 22/11/20.
//

import XCTest
@testable import GitChallenge

class UserViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testValidaSeCampoTemValor() {
        
        let usuario = Usuario(nome: "Bruno")
        XCTAssertEqual("Bruno", usuario.nome)
    }
}
