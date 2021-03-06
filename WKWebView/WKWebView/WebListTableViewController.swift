//
//  WebListTableViewController.swift
//  WKWebView
//
//  Created by home on 2018/08/22.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class WebListTableViewController: UITableViewController {
    
    
    // セルに表示するデータ
    let webList = [
        (name: "アップル", url:"https://www.apple.com/jp/"),
        (name: "国立天文台", url:"https://www.nao.ac.jp"),
        (name: "東京都美術館", url:"https://www.tobikan.jp/"),
        (name: "amazon", url:"https://www.amazon.co.jp"),
        (name: "はてなブックマーク", url:"http://b.hatena.ne.jp/"),
        (name: "ブランディアオークション", url:"https://sa.brandear.jp/")
    ]
    
    // MARK: - Table view data source
    
    // セクションの個数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セクション内の行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 配列webListの値の個数
        return webList.count
    }
    
    // セルを作る
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // テーブルのセルを参照
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // テーブルにwebListのデータを表示
        let webData = webList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = webData.name
        cell.detailTextLabel?.text = webData.url
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // セグエで移動する前にデータを受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // セグエがshowWebPageのときの処理
        if segue.identifier == "showWebPage" {
            // タップした行番号を取り出す
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // 行のデータを取り出す
                let webData = webList[(indexPath as NSIndexPath).row]
                // 移動先のビューコントローラのdataプロパティに値を設定する
                (segue.destination as! ViewController).data = webData
            }
        }
    }

}
