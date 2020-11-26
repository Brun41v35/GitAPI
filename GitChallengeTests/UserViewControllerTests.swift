//
//  UserViewControllerTests.swift
//  GitChallengeTests
//
//  Created by Bruno Silva on 22/11/20.
//

import XCTest
@testable import GitChallenge

class UserViewControllerTests: XCTestCase {
    
    var user: UserViewController!
    
    override func setUpWithError() throws {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        user = storyboard.instantiateViewController(withIdentifier: "userView") as? UserViewController
        user.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        user.loadViewIfNeeded()
    }
    
    func testValidaSeTextFieldEstaConectado() {
        do {
            let userTextField = try XCTUnwrap(user.tfNameUser, "Olha, o tfNameUser não está conectado!")
        } catch {
            print(error)
        }
    }
    
    func testValidaSeCampoTemEntradaCorreta() {
        do {
            let userTextField = try XCTUnwrap(user.tfNameUser, "Olha, o tfNameUser não está conectado!")
            XCTAssertEqual(userTextField.textContentType, UITextContentType.name, "tfNameUser não está com o content type nome")
        } catch {
            print(error)
        }
    }
    
    func testValidaSeBotaoTemAcao() {
        
        let getUsersButton: UIButton = user.getUsers
        XCTAssertNotNil(getUsersButton, "User View Controller não tem proprieda UIButton")
        
        guard let getUsersActions = getUsersButton.actions(forTarget: user, forControlEvent: .touchUpInside) else {
        XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
        return
        }
        
        XCTAssertTrue(getUsersActions.contains("salvarNome:"))
    }
}
