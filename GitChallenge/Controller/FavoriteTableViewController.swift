//
//  FavoriteTableViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 18/11/20.
//

import UIKit

var gitListFav: [ModelGit] = []

class FavoriteTableViewController: UITableViewController, DetailViewControllerDelegate {
    
    //MARK: - Ciclo de vida View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: - Metodos Table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitListFav.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        
        let git = gitListFav[indexPath.row]
        cell.testeCell(with: git)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            gitListFav.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func addFavorito(_ gitFavorito: ModelGit) {
        gitListFav.append(gitFavorito)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? DetailGitViewController {
            detail.delegate = self
        }
    }
}
