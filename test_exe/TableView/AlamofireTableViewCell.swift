//
//  AlamofireTableViewCell.swift
//  test_exe
//
//  Created by Jirawat on 12/2/2564 BE.
//

import UIKit

class AlamofireTableViewCell: UITableViewCell {
    static let identifier = "AlamofireTableViewCell"
    static let nib = UINib(nibName: AlamofireTableViewCell.identifier, bundle: nil)

    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(_ data : Country?){
        nameLabel.text = data?.name
    }
}
