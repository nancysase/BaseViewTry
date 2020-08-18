//
//  RecievevdTableViewController.swift
//  BaseViewSample
//
//  Created by SASE Koichiro on 2020/08/17.
//  Copyright © 2020 SASE Koichiro. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import ChameleonFramework

class RecievevdTableViewController: UITableViewController, IndicatorInfoProvider {

    var itemInfo: IndicatorInfo = "Recieved"
    
    //←要array削除
    var dateArray = ["2030/8/17", "2030/8/18" ,"2030/8/19", "2030/8/20", "2030/8/21","2030/8/22", "2030/8/23" ,"2030/8/24", "2030/8/25", "2030/8/26", "2030/8/27", "2030/8/28" ,"2030/8/29", "2030/8/30", "2030/8/31", "2030/9/1"]
    var contentArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon", "Go to Supermarket", "Buy Coffee", "Find ass hole", "Buy Girl", "Destroy City", "Go to Hell", "Buy Misile", "Kiss Mike", "Eat Eggs", "Fuck Demogorgon", "Steal from Supermarket", "Sex & Coffee", "love Neighbour"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contentArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    //←要array変更
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let date = cell.viewWithTag(1) as! UILabel
        date.text = dateArray[indexPath.row]
        let content = cell.viewWithTag(2) as! UILabel
        content.text = contentArray[indexPath.row]
        // 赤のグラデーションになるように設定
        if let color = FlatSkyBlue().darken(byPercentage: CGFloat(indexPath.row) / CGFloat(contentArray.count)) {
            cell.backgroundColor = color
            date.textColor = ContrastColorOf(color, returnFlat: true)
            content.textColor = ContrastColorOf(color, returnFlat: true)
        }
        return cell
    }
    
    // SwipeしたときにCompleteとDeteteができるようにする
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 完了済み(Complete)のアクションを設定する←要動作変更
        // できればTitleもImageと一緒に表示させたいができるのか？
        let completeAction = UIContextualAction(style: .normal, title: "Complete") {
            (ctxAction, view, completionHandler) in
            print("Completeを実行する")
            completionHandler(true)
        }
        // Completeボタンのデザインを設定する←要色調整
        let completeImage = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(UIColor.white, renderingMode: .alwaysTemplate)
        completeAction.image = completeImage
        completeAction.backgroundColor = UIColor(red: 0/255, green: 125/255, blue: 255/255, alpha: 1)
        // 削除のアクションを設定する←要array変更
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (ctxAction, view, completionHandler) in
            self.dateArray.remove(at: indexPath.row)
            self.contentArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        // 削除ボタンのデザインを設定する←要色調整
        let trashImage = UIImage(systemName: "trash.fill")?.withTintColor(UIColor.white , renderingMode: .alwaysTemplate)
        deleteAction.image = trashImage
        deleteAction.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        // スワイプでの削除を無効化して設定する
        let swipeAction = UISwipeActionsConfiguration(actions:[deleteAction, completeAction])
        swipeAction.performsFirstActionWithFullSwipe = false
        
        return swipeAction
    }
    
}
