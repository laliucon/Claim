//
//  FieldValueViewGenerator.swift
//  TestProject
//
//  Created by Hung Cun on 11/24/20.
//

import UIKit

class FieldValueViewGenerator {
    var lblName: String!
    var txtName: String!
    
    init(n: String, t: String) {
        lblName = n
        txtName = t
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        
        let lbl = UILabel()
        lbl.text = lblName
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        let val = UITextField()
        val.text = txtName
        val.backgroundColor = UIColor.gray
        stackView.addArrangedSubview(val)
        
        
        return stackView
    }
}
