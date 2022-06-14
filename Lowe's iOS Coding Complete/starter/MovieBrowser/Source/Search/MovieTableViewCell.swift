//
//  MovieTableViewCell.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var releaseLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    var vm: MovieVM? {
        didSet {
            updateCell()
        }
    }
    
    func configure(vm: MovieVM) {
        self.vm = vm
    }
    
    func updateCell() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.vm?.title
            self.releaseLabel.text = self.vm?.releasedDateSearch
            if let rating = self.vm?.rating {
                self.ratingLabel.text = String(rating)
            }
        }
    }
    
}
