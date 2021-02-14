//
//  v.swift
//  test_exe
//
//  Created by Jirawat on 11/2/2564 BE.
//

import Foundation
import UIKit

class AlmofireListViewController: BaseViewController {
    static let identifier = "AlmofireListViewController"

   
    @IBOutlet var tableView: UITableView!

    var countries = [Country]()

    
    override func viewDidLoad() {
        initTableView()
        initcomponent()
        feed()
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

    func feed() {
//        https://jsonplaceholder.typicode.com/posts/1
//        https://restcountries.eu/rest/v2/
        let service = Service(baseUrl: "https://restcountries.eu/rest/")
        service.getAllCountryNameFrom(endPoint: "v2")
        service.completionHandler { [weak self] countries, status, _ in
            if status {
                guard let self = self else { return }
                guard let _countries = countries else { return }
                self.countries = _countries
                self.tableView.reloadData()
            }
        }
    }
}

extension AlmofireListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlamofireTableViewCell.identifier, for: indexPath) as? AlamofireTableViewCell else { return UITableViewCell() }
        let country = countries[indexPath.row]
        cell.setCell(country)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) {
//            cell.contentView.backgroundColor = UIColor.black
//        }
    }
}
