//
//  ViewController.swift
//  Alura Ingressos
//
//  Created by Breno Luizetto Cintra on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: -Outlets
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var imagemBanner: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagemBanner.layer.cornerRadius = 10
        self.imagemBanner.layer.masksToBounds = true

        
    }

    @IBAction func botaoComprar(_ sender: UIButton) {
        let textFieldsEstaoPreenchidos = ValidaFormulario().verificaTextFieldsPreenchidos(textFields: textFields)
        let textFieldsEstaoValidos = ValidaFormulario().verificaTextFieldsValidos(listaDeTextFields: textFields)
        
        if textFieldsEstaoPreenchidos && textFieldsEstaoValidos {
            let alerta = ValidaFormulario().exibeNotificacaoDePreenchimentoDosTextfields(titulo: "Parabens", mensagem: "Compra Realizada")
            present(alerta, animated: true, completion: nil)
        } else {
            let alerta = ValidaFormulario().exibeNotificacaoDePreenchimentoDosTextfields(titulo: "Atenção", mensagem: "Preencha corretamente")
             present(alerta, animated: true, completion: nil)
        }
    }
    
}

