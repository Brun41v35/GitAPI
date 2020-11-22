//
//  UserViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 16/11/20.
//

import UIKit

class UserViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tfNameUser: UITextField!
    
    //MARK: - Variaveis
    var nomeUser = ""
    
    //MARK: - Ciclo de vida VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Metodo responsavel por esconder teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: - IBAction
    @IBAction func salvarNome(_ sender: Any) {
        
        guard let nome = tfNameUser.text else { return }
        
        if nome.isEmpty == true {
            
            // MARK: Criando o Alert
            let alerta = UIAlertController(title: "Calm down", message: "I need to know your name 😔", preferredStyle: UIAlertController.Style.alert)
            
            // MARK: Adicionando acao
            alerta.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            // MARK: Mostrando o Alert
            self.present(alerta, animated: true, completion: nil)
            
        } else {
            
            nomeUser = nome
            
            performSegue(withIdentifier: "segue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! GitTableViewController
        vc.nomeUsuario = nomeUser
    }
}
