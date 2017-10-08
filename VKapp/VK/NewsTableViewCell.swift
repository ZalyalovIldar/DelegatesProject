//
//  NewsTableViewCell.swift
//  VK
//
//  Created by Elina on 08/10/2017.
//  Copyright © 2017 Elina. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsLabel: UILabel!
    
    func prepare(with text: String) {
        newsLabel.text = text
    }
    
}
