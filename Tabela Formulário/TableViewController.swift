//
//  TableViewController.swift
//  Tabela Formulário
//
//  Created by Cast Group on 15/01/18.
//  Copyright © 2018 Cast Group. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var labels : [UILabel]!
    
    
  
    @IBOutlet weak var txtBairro: UITextField!
    @IBOutlet weak var txtRua: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSobrenome: UITextField!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var Estado: UITextField!
    @IBOutlet weak var Cidade: UITextField!
    
    override func viewDidLoad() {
        updateWidthsForLabels(labels: labels)
    }
    
    
    @IBAction func salvar(_ sender: UIButton) {
    
        let alert = UIAlertController(title: "ALERTA!", message: "Cadastro efetuado com sucesso!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        
       present(alert, animated: true) { _ in }
       
    }
    
    private func calculateLabelWidth(label: UILabel) -> CGFloat {
    
        let labelSize = label.sizeThatFits(
            CGSize(width: CGFloat.greatestFiniteMagnitude, height: label.frame.height))
        
        return labelSize.width
    }
    
    
    private func calculateMaxLabelWidth(labels: [UILabel]) -> CGFloat{
    
        return  labels.map{calculateLabelWidth(label: $0)}.max()!
    }
    
    private func updateWidthsForLabels(labels: [UILabel]) {
    
        let maxLabelWidth = calculateMaxLabelWidth(labels: labels)
        
        for label in labels {
        
            let constraint = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: maxLabelWidth)
            
            label.addConstraint(constraint)
        
        }
        
    }
}
