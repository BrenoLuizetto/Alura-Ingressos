//
//  ValidaFormulario.swift
//  Alura Ingressos
//
//  Created by Breno Luizetto Cintra on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ValidaFormulario: NSObject {

    
    func verificaTextFieldsPreenchidos(textFields: Array <UITextField>) -> Bool {
        for textField in textFields {
            if textField.text == ""{
                return false
            }
        }
        
        return true
    }
    
    func exibeNotificacaoDePreenchimentoDosTextfields(titulo: String, mensagem: String) -> UIAlertController{
        
        let notificacao = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        notificacao.addAction(botao)
        
        return notificacao
    }
}
