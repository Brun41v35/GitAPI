//
//  GitTableViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 15/11/20.
//

import UIKit

class GitTableViewController: UITableViewController {
    
    //MARK: - Variaveis
    var informacoesGit: [ModelGit] = []    
    var recebeNome: String?
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "main")
        return label
    }()
    
    //MARK: - Ciclo de vida View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Carregando Users.."
        
        guard let nomeUsuario = recebeNome else {
            print("Nao recebi o nome..")
            return
        }
        let user = Usuario(nome: nomeUsuario)
        self.navigationItem.title = "Hey, \(user.nome)"        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        REST.carregaInfo { (informacoesGit) in
            
            self.informacoesGit = informacoesGit
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } onError: { (error) in
            print(error)
        }
    }
    
    //MARK: - Prepare: Passando as informacoes para outra Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetails" {
            let vc = segue.destination as! DetailGitViewController
            vc.gitModel = informacoesGit[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informacoesGit.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitTableViewCell
        
        let git = informacoesGit[indexPath.row]
        cell.prepareCell(with: git)
        
        return cell
    }
}
