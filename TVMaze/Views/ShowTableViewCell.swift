//
//  ShowTableViewCell.swift
//  TVMaze
//
//  Created by Alan Rodriguez on 12/10/20.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    @IBOutlet weak var airtimeLabel: UILabel!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var showTitleLabel: UILabel!
    
    func configure(for show: Show?) {
        airtimeLabel.text = show?.airtime
        episodeTitleLabel.text = show?.episodeName
        showTitleLabel.text = show?.showName
    }

}
