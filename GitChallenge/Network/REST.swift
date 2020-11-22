//
//  REST.swift
//  GitChallenge
//
//  Created by Bruno Silva on 14/11/20.
//

import Foundation

enum GitError {
    case url
    case tarefaErro (erro: Error)
    case semResposta
    case semDados
    case statusCodeErro(code: Int)
    case jsonInvalido
}

class REST {
    
    //MARK: - Atributos
    private static let baseURL = "https://api.github.com/gists/public"
    
    //MARK: - Responsavel por carregar as informacoes API
    class func carregaInfo(onComplete: @escaping ([ModelGit]) -> Void, onError: @escaping (GitError) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            onError(.url)
            return
        }
        
        //MARK: Criando uma terafa
        let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
            
            if erro == nil {
                guard let response = requisicao as? HTTPURLResponse else {
                    onError(.semResposta)
                    return
                }
                if response.statusCode == 200 {
                    guard let dadosRecebidos = dados else { return }
                    do {
                        let gitInfo = try JSONDecoder().decode([ModelGit].self, from: dadosRecebidos)
                        onComplete(gitInfo)
                    } catch {
                        onError(.jsonInvalido)
                    }
                } else {
                    onError(.statusCodeErro(code: response.statusCode))
                }
            } else {
                onError(.tarefaErro(erro: erro!))
            }
        }
        tarefa.resume()
    }
}
