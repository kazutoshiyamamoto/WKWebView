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

// http://begigrammer.hatenablog.com/entry/2017/03/14/215153
extension ViewController: WKNavigationDelegate {
    // 読み込み開始時イベント
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start")
    }
    
    // 読み込み終了時イベント
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish")
    }
    
    // 読み込み失敗時イベント
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("fail")
    }
    
    // リダイレクト先のURLを取得
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print(webView.url?.absoluteString as Any)
    }
    
}

