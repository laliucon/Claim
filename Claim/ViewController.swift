//
//  ViewController.swift
//  TestProject
//
//  Created by Hung Cun on 11/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    var lbls = [UILabel]()
    var vals = [UITextField]()
    var addButton : UIButton!
    var cService: ClaimService!
    
    @objc func addClaim(sender: UIButton) {
        guard vals[0].text!.count < 5 else {
            return
        }
    
        cService.addClaim(pObj: Claim(this_title: vals[0].text!, this_date: vals[1].text!))
        if cService.addComplete == true {
            vals[2].text = "Claim \(vals[0].text) was successfully created."
        } else {
            vals[2].text = "Claim \(vals[0].text) failed to created.V"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1.Prepare the UI Screen
        let vGenerator = ClaimDetailSectionGenerator()
        let sView = vGenerator.generate()
        //
        view.addSubview(sView)
        //
        let cViews = sView.arrangedSubviews
        for sv in cViews {
            let innerStackView = sv as! UIStackView
            let cnt = innerStackView.arrangedSubviews.count
            if cnt > 1 {
                for ve in innerStackView.arrangedSubviews {
                    if ve is UITextField {
                        vals.append(ve as! UITextField)
                    } else {
                        lbls.append(ve as! UILabel)
                    }
                }
            }else {
                addButton = innerStackView.arrangedSubviews[0] as? UIButton
            }
        }
        for i in 0...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[0].widthAnchor.constraint(equalToConstant: view.frame.width * 0.25)
        constr.isActive = true
        //
        for i in 0...lbls.count-1 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[0].trailingAnchor)
            constr.isActive = true
        }
        //
        for i in 0...vals.count-1 {
            //vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
 
        
        sView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = sView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let lCont = sView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trCont = sView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
        
        addButton.addTarget(self, action: #selector(addClaim), for: .touchUpInside)
    }


}

