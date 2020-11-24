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
    var filterList: [ModelGit]!
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        
        REST.carregaInfo { (informacoes) in
            
            self.informacoesGit = informacoes
            DispatchQueue.main.async {
                self.searchBar.delegate = self
                self.filterList = self.informacoesGit
                self.tableView.reloadData()
            }
        } onError: { (error) in
            print(error)
        }
        filterList = informacoesGit
    }
    
    //MARK: - Prepare: Passando as informacoes para outra Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewDetails" {
            let vc = segue.destination as! DetailGitViewController
            vc.gitModel = filterList[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitTableViewCell
        
        let git = filterList[indexPath.row]
        cell.prepareCell(with: git)
        
        return cell
    }
    
    //MARK: - Search Bar function
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            filterList = informacoesGit
        } else {
            filterList = informacoesGit.filter { $0.owner.login.lowercased().contains(searchText.lowercased()) }
        }
        self.tableView.reloadData()
    }
}
