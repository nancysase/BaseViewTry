//
//  TagViewController.swift
//  BaseViewSample
//
//  Created by SASE Koichiro on 2020/08/17.
//  Copyright © 2020 SASE Koichiro. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TagViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //バーの色
        settings.style.buttonBarBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //ボタンの色
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //セルの文字色
        settings.style.buttonBarItemTitleColor = UIColor.white
        //セレクトバーの色
        settings.style.selectedBarBackgroundColor = UIColor(red: 254/255, green: 0, blue: 124/255, alpha: 1)
        
        //スクロールできなくする
        self.containerView.isScrollEnabled = false
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
         //管理されるViewControllerを返す処理
         let sentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SentMessage")
         let receivedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReceivedMessage")
         let childViewControllers:[UIViewController] = [sentVC, receivedVC]
         return childViewControllers
     }

    @IBAction func addButton(_ sender: Any) {
        //ToDoとMemoのViewでのみ利用
    }
}
