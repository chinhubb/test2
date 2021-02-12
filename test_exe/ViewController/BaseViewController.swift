//
//  BaseViewController.swift
//  test_exe
//
//  Created by Jirawat on 12/2/2564 BE.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showAlert(_ message: String, _ complete: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: complete))
        present(alert, animated: true, completion: nil)
    }
}
