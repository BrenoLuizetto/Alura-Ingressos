//
//  PickerViewParcela.swift
//  Alura Ingressos
//
//  Created by Breno Luizetto Cintra on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

protocol PickerViewNumeroDeParcela {
    func pickverViewParcelaSelecionada(parcela:String)
}

class PickerViewParcela: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate:PickerViewNumeroDeParcela?

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if delegate != nil{
            delegate?.pickverViewParcelaSelecionada(parcela: "\(row+1)")
        }
        
    }
}
