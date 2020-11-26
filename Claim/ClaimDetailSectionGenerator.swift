//
//  ClaimDetailSectionGenerator.swift
//  TestProject
//
//  Created by Hung Cun on 11/24/20.
//

import UIKit

class ClaimDetailSectionGenerator {

    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15
        
        var vGenerator: FieldValueViewGenerator!
        var sView: UIStackView!
        let tStackView = UIStackView()
        tStackView.axis = .horizontal
        tStackView.distribution = .fill
        tStackView.spacing = 5
        let title = UILabel()
        title.text =  "Please Enter Claim Information"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        tStackView.addArrangedSubview(title)
        stackView.addArrangedSubview(tStackView)
        
        vGenerator = FieldValueViewGenerator(n: "Claim Title", t: "Enter Claim Title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n: "Date", t: "Enter Claim Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fillProportionally
        bStackView.spacing = 5
        
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.white, for: .highlighted)
        btn.backgroundColor = UIColor.white
        btn.contentHorizontalAlignment = .trailing
        bStackView.addArrangedSubview(btn)
        stackView.addArrangedSubview(bStackView)
        vGenerator = FieldValueViewGenerator(n: "Status:", t: "<Status Message>")
        sView = vGenerator.generate()
       
       
        stackView.addArrangedSubview(sView)
        return stackView
    }
}

