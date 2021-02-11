//
//  ViewController.swift
//  test_exe
//
//  Created by Jirawat on 10/2/2564 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var btnClick: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testLabel.text = "click"
    }

    @IBAction func click_web(_ sender: Any) {
        Navigator.share.toClick(self)
    }
    @IBAction func click_list(_ sender: Any) {
        Navigator.share.toAlmofire(self)
    }
    
}

