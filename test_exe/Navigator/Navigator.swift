//
//  Navigator.swift
//  test_exe
//
//  Created by Jirawat on 10/2/2564 BE.
//

import Foundation
import UIKit

class  Navigator  {
    
    static let share = Navigator()
    
    func toClick(_ viewController : UIViewController){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: ClickViewController.identifier) as? ClickViewController else { return }
        
        if let navigation = viewController.navigationController {
            navigation.setNavigationBarHidden(false, animated: true)
            navigation.viewControllers = [vc]
        } else {
            let navigation = UINavigationController(rootViewController: vc)
            navigation.modalPresentationStyle = .overFullScreen
            viewController.present(navigation, animated: true, completion: nil)
        }
        
    }
    

}