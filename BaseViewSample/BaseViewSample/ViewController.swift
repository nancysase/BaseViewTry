//
//  ViewController.swift
//  BaseViewSample
//
//  Created by SASE Koichiro on 2020/08/17.
//  Copyright © 2020 SASE Koichiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func detailStoryBoard(_ sender: Any) {
        let sampleSB = UIStoryboard(name: "Base", bundle: nil)
        let sampleVC = sampleSB.instantiateViewController(withIdentifier: "Base")
        self.navigationController?.pushViewController(sampleVC, animated: true)
        
    }
    
}

