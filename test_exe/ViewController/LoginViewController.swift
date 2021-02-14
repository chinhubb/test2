//
//  LoginViewController.swift
//  test_exe
//
//  Created by Jirawat on 14/2/2564 BE.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController {
    static let identifier = "LoginViewController"

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    private let dummyDB = [User(username: "chinchin", password: "mis@Pass01")]
    private var validation: ValidationService

    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        initcomponent()
    }
    
    func initcomponent() {
//        let closeButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_pink_left"), style: .done, target: self, action: #selector(onClose))
        let closeButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onClose))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func onClose() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func toLogin(_ sender: Any) {
        do {
            let username = try validation.validateUsername(usernameTextField.text)
            let pass = try validation.validateUsername(passwordTextField.text)

            if let user = dummyDB.first(where: { user in
                user.username == username && user.password == pass
            }) {
//                showAlert("You successfully logged in as \(user.username)")
                Navigator.share.toAlmofire(self)
            } else {
                throw ValidationError.invalidCredentials
            }
        } catch {
            showAlert("\(error)")
        }
    }
}
