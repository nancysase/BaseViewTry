//
//  DetailModelViewController.swift
//  BaseViewSample
//
//  Created by SASE Koichiro on 2020/08/22.
//  Copyright © 2020 SASE Koichiro. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class DetailModelViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendToTextField: UITextField!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var send: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let blackColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)

    override func viewDidLoad() {
        
        view.backgroundColor = .flatWatermelon()
        scrollView.backgroundColor = .flatWatermelon()
        
        textView.textColor = blackColor
        dueDateTextField.textColor = blackColor
        sendToTextField.textColor = blackColor
        
        save.setTitleColor(blackColor, for: .normal)
        send.setTitleColor(blackColor, for: .normal)
        delete.setTitleColor(blackColor, for: .normal)
        
        dueDateTextField.textAlignment = .center
        
        textView.layer.cornerRadius = 5
        save.layer.cornerRadius = 5
        send.layer.cornerRadius = 5
        delete.layer.cornerRadius = 5
        
        //バーの色
        settings.style.buttonBarBackgroundColor = blackColor
        //ボタンの色
        settings.style.buttonBarItemBackgroundColor = blackColor
        //セルの文字色
        settings.style.buttonBarItemTitleColor = UIColor.white
        //セレクトバーの色
        settings.style.selectedBarBackgroundColor = UIColor.white
        
        super.viewDidLoad()
        
        //スクロールできなくする
        self.containerView.isScrollEnabled = false

    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
         //管理されるViewControllerを返す処理
         let sentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SendingHistory")
         let receivedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecievingHistory")
         let childViewControllers:[UIViewController] = [sentVC, receivedVC]
         return childViewControllers
     }
    



}
