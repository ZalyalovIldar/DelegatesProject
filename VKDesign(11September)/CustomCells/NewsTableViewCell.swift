//
//  NewsTableViewCell.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 02/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var repostsLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userSurnameLabel: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    let radiusRoundCorner: CGFloat = 50

    
    func prepare(with newsModel: News) {
    
        noteLabel.text = newsModel.text
        likesLabel.text = newsModel.likesCount
        commentsLabel.text = newsModel.commentsCount
        repostsLabel.text = newsModel.repostsCount
        newImage.image = newsModel.image
        userNameLabel.text = newsModel.name
        userSurnameLabel.text = newsModel.surname
        dateLabel.text = newsModel.date
        userAvatarImage.roundCorners([.bottomLeft, .bottomRight, .topLeft, .topRight], radius: radiusRoundCorner)
        
    }
}
