//
//  ViewController.swift
//  test_exe
//
//  Created by Jirawat on 10/2/2564 BE.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    static let identifier = "ViewController"

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var btnClick: UIButton!
    
    @IBOutlet weak var taskName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initComnponent()
        
    }
    
    func initComnponent(){
        testLabel.text = "Choose"
    }

    @IBAction func click_web(_ sender: Any) {
        Navigator.share.toClick(self)
    }
    @IBAction func click_list(_ sender: Any) {
        Navigator.share.toAlmofire(self)
    }
    @IBAction func click_login(_ sender: Any) {
        Navigator.share.toLogin(self)
    }
    
}

