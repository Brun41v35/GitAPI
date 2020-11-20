//
//  GitTableViewCell.swift
//  GitChallenge
//
//  Created by Bruno Silva on 15/11/20.
//

import UIKit
import Kingfisher

class GitTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var file: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var imageFav: UIButton!
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Funcoes
    func prepareCell(with git: ModelGit) {
        login.text = git.owner.login
        file.text = git.owner.type
        if let url = URL(string: git.owner.image) {
            imageProfile.kf.indicatorType = .activity
            imageProfile.kf.setImage(with: url)
        } else {
            imageProfile?.image = nil
        }
        imageProfile.layer.cornerRadius = imageProfile.frame.size.height / 5.0
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.borderWidth = 2
    }
}
