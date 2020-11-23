//
//  FavoriteTableViewCell.swift
//  GitChallenge
//
//  Created by Bruno Silva on 18/11/20.
//

import UIKit
import Kingfisher

class FavoriteTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var file: UILabel!
    @IBOutlet weak var labelNameGit: UILabel!
    @IBOutlet weak var imageGit: UIImageView!
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Funcoes
    func testeCell(with git: ModelGit) {
        labelNameGit.text = git.owner.login
        file.text = git.owner.type
        if let url = URL(string: git.owner.image) {
            imageGit.kf.indicatorType = .activity
            imageGit.kf.setImage(with: url)
        } else {
            imageGit?.image = nil
        }
        imageGit.layer.cornerRadius = imageGit.frame.size.height / 5.0
        imageGit.layer.borderColor = UIColor.white.cgColor
        imageGit.layer.borderWidth = 2
    }
}
