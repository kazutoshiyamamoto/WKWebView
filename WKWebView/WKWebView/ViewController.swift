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
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = webView
    }
    
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
        
//        let encodeURL = webData.url
//        let myRequest = encodeURL.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlFragmentAllowed)
//        let myRequest2 = URL(string: myRequest!)
//
//        let test = URLRequest(url: myRequest2!)
        
        // Webを読み込む
        webView.load(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: WKUIDelegate {
    
}

extension ViewController: WKNavigationDelegate {

    
}

