//
//  WebUserViewController.swift
//  GitChallenge
//
//  Created by Bruno Silva on 21/11/20.
//

import UIKit
import WebKit

class WebUserViewController: UIViewController {
    
    //MARK: - Variaveis
    var gitModel: ModelGit!

    //MARK: - IBOutlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: gitModel.owner.htmlURL)
        let request = URLRequest(url: url!)
        
        title = gitModel.owner.login
        
        //MARK: Usuario consegue navegar pra cima e pra baixo (sem precisa de botoes)
        webView.allowsBackForwardNavigationGestures = true
        
        webView.load(request)
    }
}
