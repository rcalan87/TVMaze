//
//  UIImageView+URL.swift
//  TVMaze
//
//  Created by Alan Rodriguez on 12/10/20.
//

import UIKit

extension UIImageView {
    func load(from imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
