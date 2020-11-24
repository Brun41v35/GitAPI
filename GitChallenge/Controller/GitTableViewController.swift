//
//  GitTableViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 15/11/20.
//

import UIKit

class GitTableViewController: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Variaveis
    var informacoesGit: [ModelGit] = []    
    var recebeNome: String?
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(named: "main")
        return label
    }()
    var filterInfo: [ModelGit]!
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Ciclo de vida View
    override func viewDidLoad() {
        super.viewDidLoad()
            
        guard let nomeUsuario = recebeNome else { return }
        let user = Usuario(nome: nomeUsuario)
        self.navigationItem.title = "Hey, \(user.nome)"        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = "Carregando Users.."
        
        REST.carregaInfo { (informacoes) in
            
            self.informacoesGit = informacoes
            DispatchQueue.main.async { [self] in
                searchBar.delegate = self
                self.filterInfo = informacoesGit
                self.tableView.reloadData()
            }
        } onError: { (error) in
            print(error)
        }
        filterInfo = informacoesGit
    }
    
    //MARK: - Prepare: Passando as informacoes para outra Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetails" {
            let vc = segue.destination as! DetailGitViewController
            vc.gitModel = filterInfo[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitTableViewCell
        let git = filterInfo[indexPath.row]
        
        cell.prepareCell(with: git)
        
        return cell
    }
    
    //MARK: - Search Bar Config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            filterInfo = informacoesGit
        } else {
            filterInfo = informacoesGit.filter { $0.owner.login.lowercased().contains(searchText.lowercased()) }
        }
        self.tableView.reloadData()
    }
}
