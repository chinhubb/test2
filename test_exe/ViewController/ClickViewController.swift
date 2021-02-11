//
//  ClickViewController.swift
//  test_exe
//
//  Created by Jirawat on 10/2/2564 BE.
//

import UIKit
import WebKit

class ClickViewController: UIViewController {
    static let identifier = "ClickViewController"
    override func viewDidLoad() {
        initcomponent()
        showWeb()
    }
    
    func initcomponent(){
        let newBtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(anotherMethod))
           self.navigationItem.leftItemsSupplementBackButton = true
           self.navigationItem.leftBarButtonItem = newBtn
    }
    
    @objc func anotherMethod(){
        dismiss(animated: true, completion: nil)
    }
    
    func showWeb(){
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
           self.view.addSubview(webView)
           let url = URL(string: "https://linecorp.com/th/")
           webView.load(URLRequest(url: url!))
    }
}
