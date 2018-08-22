//
//  ViewController.swift
//  WKWebView
//
//  Created by home on 2018/08/22.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    // シーン移動の際に設定されるWebデータ
    var data: (name: String, url: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // dataが設定されていればwebDataに代入する
        guard let webData = data else {
            return
        }
        // 表示するWebページのURLRequestを作る
        let myURL = URL(string: webData.url)
        let myRequest = URLRequest(url: myURL!)
        // Webを読み込む
        webView.load(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

