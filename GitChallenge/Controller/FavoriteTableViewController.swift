//
//  FavoriteTableViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 18/11/20.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    //MARK: - Variaveis
    var gitListFav: [ModelGit] = []
    
    //MARK: - Ciclo de vida View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: - Metodos Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return gitListFav.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitListFav.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        let git = gitListFav[indexPath.row]
        cell.testeCell(with: git)
        
        return cell
    }
    
    func addFav(_ gitModel: ModelGit) {
        print("Estou sendo chamado")
        gitListFav.append(gitModel)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? DetailGitViewController {
            details.tableViewController = self
        }
    }
}
