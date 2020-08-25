//
//  BaseViewController.swift
//  BaseViewSample
//
//  Created by SASE Koichiro on 2020/08/23.
//  Copyright © 2020 SASE Koichiro. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import ChameleonFramework

class BaseViewController: ButtonBarPagerTabStripViewController {
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var createdAtDate: UILabel!
    @IBOutlet weak var updatedAt: UILabel!
    @IBOutlet weak var updatedAtDate: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var dueDateText: UITextField!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var sendTo: UILabel!
    @IBOutlet weak var sendToText: UITextField!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var send: UIButton!
    @IBOutlet weak var delete: UIButton!
    
    let blackColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
    let blackColorCg = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1).cgColor
    let accentColor = UIColor.flatWatermelon()
    let accentColorCg = UIColor.flatWatermelon().cgColor
    let whiteColor = UIColor.flatWhite()

    override func viewDidLoad() {
        titleLabel.textColor = accentColor
        createdAt.textColor = blackColor
        createdAtDate.textColor = blackColor
        updatedAt.textColor = blackColor
        updatedAtDate.textColor = blackColor
        dueDate.textColor = blackColor
        content.textColor = blackColor
        sendTo.textColor = blackColor
        
        dueDateText.textColor = accentColor
        dueDateText.borderStyle = .none
        dueDateText.layer.borderColor = UIColor.lightGray.cgColor
        dueDateText.layer.borderWidth = 0.5
        dueDateText.layer.cornerRadius = 5
        
        contentText.textColor = accentColor
        contentText.layer.borderColor = UIColor.lightGray.cgColor
        contentText.layer.borderWidth = 0.5
        contentText.layer.cornerRadius = 5
        
        sendToText.textColor = accentColor
        sendToText.borderStyle = .none
        sendToText.layer.borderColor = UIColor.lightGray.cgColor
        sendToText.layer.borderWidth = 0.5
        sendToText.layer.cornerRadius = 5

        save.setTitleColor(whiteColor, for: .normal)
        save.layer.cornerRadius = 5
        save.layer.backgroundColor = accentColorCg
        
        send.setTitleColor(whiteColor, for: .normal)
        send.layer.cornerRadius = 5
        send.layer.backgroundColor = accentColorCg
        
        delete.setTitleColor(whiteColor, for: .normal)
        delete.layer.cornerRadius = 5
        delete.layer.backgroundColor = blackColorCg
        
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
         let sentVC = UIStoryboard(name: "Base", bundle: nil).instantiateViewController(withIdentifier: "Send")
         let receivedVC = UIStoryboard(name: "Base", bundle: nil).instantiateViewController(withIdentifier: "Recieve")
         let childViewControllers:[UIViewController] = [sentVC, receivedVC]
         return childViewControllers
     }



}
