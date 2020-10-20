//
//  DetailsViewController.swift
//  TVMaze
//
//  Created by Alan Rodriguez on 12/10/20.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var show: Show?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(show)
    }
    
    private func configure(_ show: Show?) {
        guard let show = show else  { return }
        
        titleLabel.text = show.showName
        averageLabel.text = String(show.showAverage ?? 0)
        genreLabel.text = show.showGenres?.joined(separator: "/")
        summaryTextView.text = show.showSummary?.htmlToString
        imageView.load(from: show.showImageURL ?? "")
    }

}
