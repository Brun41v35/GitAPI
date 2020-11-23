//
//  DetailGitViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 15/11/20.
//

import UIKit
import Kingfisher

protocol DetailViewControllerDelegate {
    func addFavorito(_ gitFavorito: ModelGit)
}

class DetailGitViewController: UIViewController {
    
    //MARK: - Variaveiss
    var gitModel: ModelGit!
    var delegate: DetailViewControllerDelegate?
    
    //MARK: - IBOutlets
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    //MARK: - IBAction
    @IBAction func addFavorite(_ sender: Any) {
        
        gitListFav.append(gitModel)
        delegate?.addFavorito(gitModel)
                
        // MARK: Criando o Alert
        let alerta = UIAlertController(title: "Successes", message: "User added with successes 🎊", preferredStyle: UIAlertController.Style.alert)
        
        // MARK: Adicionando acao
        alerta.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        // MARK: Mostrando o Alert
        self.present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func viewProfile(_ sender: Any) {
        
    }
    
    //MARK: - Ciclo de vida VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Details"
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
    
    //MARK: - Responsavel por passar informacoes entre telas.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webUser = segue.destination as! WebUserViewController
        webUser.gitModel = gitModel
    }
}
