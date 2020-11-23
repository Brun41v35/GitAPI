//
//  RestTests.swift
//  GitChallengeTests
//
//  Created by Bruno Silva on 23/11/20.
//

import XCTest
@testable import GitChallenge

class RestTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testValidaAPI() {
        
        guard let url = URL(string: "https://api.github.com/gists/public") else {
            fatalError("Não consegui abrir a URL")
        }
        
        let tarefaTest = URLSession.shared.dataTask(with: url) { (dados, requisicao, error) in
            
            if error == nil {
                
                XCTAssertNil(error, "Opa, deu certo! Nenhum erro")
                
                guard let response = requisicao as? HTTPURLResponse else { return }
                
                XCTAssertEqual(response.statusCode, 200)
            }
        }
    }
}
