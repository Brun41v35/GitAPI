//
//  DetailGitViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 15/11/20.
//

import UIKit
import Kingfisher

class DetailGitViewController: UIViewController {
    
    //MARK: - Variaveis
    var gitModel: ModelGit!
    var tableViewController = FavoriteTableViewController()
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    //MARK: - IBAction
    @IBAction func viewProfile(_ sender: Any) {
        
    }
    
    //MARK: - Metodos
    @objc func addFav(){
        
    }
    
    //MARK: - Ciclo de vida VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        let botaoFav = UIBarButtonItem(title: "Favoritar", style: .done, target: self, action: #selector(addFav))
        navigationItem.rightBarButtonItem = botaoFav
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelName.text = gitModel.owner.login
        if let url = URL(string: gitModel.owner.image) {
            imageDetail.kf.indicatorType = .activity
            imageDetail.kf.setImage(with: url)
        } else {
            imageDetail.image = nil
        }
        imageDetail.layer.cornerRadius = imageDetail.frame.size.height / 5.0
        imageDetail.layer.borderColor = UIColor.white.cgColor
        imageDetail.layer.borderWidth = 2
    }
}
