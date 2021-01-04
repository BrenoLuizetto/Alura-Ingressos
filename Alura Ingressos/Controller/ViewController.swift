//
//  ViewController.swift
//  Alura Ingressos
//
//  Created by Breno Luizetto Cintra on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    //MARK: -Outlets
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var imagemBanner: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagemBanner.layer.cornerRadius = 10
        self.imagemBanner.layer.masksToBounds = true

        
    }
    
    func buscaTextField(tipoDeTextField:TiposDeTextField, completion:(_ textFieldSolicitado:UITextField) -> Void) {
        for textField in textFields {
            if let textFieldAtual = TiposDeTextField(rawValue: textField.tag) {
                if textFieldAtual == tipoDeTextField {
                    completion(textField)
                }
            }
        }
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
    
    @IBAction func textFieldCepAlterouValor(_ sender: UITextField) {
        guard let cep = sender.text else {return}
        LocalizacaoConsultaAPI().consultaViaCepAPI(cep: cep, sucesso: { (localizacao) in
            self.buscaTextField(tipoDeTextField: .endereco, completion: { (textFieldEndereco) in
                textFieldEndereco.text = localizacao.logradouro
            })
            
            self.buscaTextField(tipoDeTextField: .bairro, completion: { (textFieldBairro) in
                textFieldBairro.text = localizacao.bairro
                
            })
            
        }) { (error) in
            print(error)
        }
       
        }
        
    }
