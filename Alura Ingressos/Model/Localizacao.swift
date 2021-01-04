//
//  Localizacao.swift
//  Alura Ingressos
//
//  Created by Breno Luizetto Cintra on 04/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Localizacao: NSObject {

    var logradouro = ""
    var bairro = ""
    var cidade = ""
    var uf = ""
    
    init(_ dicionario:Dictionary<String, String>){
        logradouro = dicionario["logradouro"] ?? ""
        bairro = dicionario["bairro"] ?? ""
        cidade = dicionario["localidade"] ?? ""
        bairro = dicionario["uf"] ?? ""


        
    }
}
