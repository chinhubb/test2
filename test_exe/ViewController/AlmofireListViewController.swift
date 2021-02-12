//
//  v.swift
//  test_exe
//
//  Created by Jirawat on 11/2/2564 BE.
//

import Foundation
import UIKit

class AlmofireListViewController: UIViewController {
    static let identifier = "AlmofireListViewController"
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        initTableView()
        initcomponent()
    }

    func initTableView() {
        tableView.register(AlamofireTableViewCell.nib, forCellReuseIdentifier: AlamofireTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func initcomponent() {
        let newBtn = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = newBtn
    }

    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }
}

extension AlmofireListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlamofireTableViewCell.identifier, for: indexPath) as? AlamofireTableViewCell else { return UITableViewCell() }
        cell.setCell()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) {
//            cell.contentView.backgroundColor = UIColor.black
//        }
    }
}
