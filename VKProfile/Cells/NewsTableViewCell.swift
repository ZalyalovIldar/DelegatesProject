//
//  WallTableViewCell.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 02.10.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet var newsActionButtons: [UIButton]!
    @IBOutlet var actionCountLabels: [UILabel]!
    
    private let likeCountLabel = 0
    private let commentCountLabel = 1
    private let repostCountLabel = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.roundCorners()
        
        for newsActionButton in newsActionButtons {
            if let originalImage = newsActionButton.image(for: .normal) {
                let tintedImage = originalImage.withRenderingMode(.alwaysTemplate)
                newsActionButton.setImage(tintedImage, for: .normal)
                newsActionButton.tintColor = .darkGray
            }
        }
        
    }
    
    func prepareCell(with news: News, from user: User) {
        avatarImageView.image = user.profileImage
        nameLabel.text = "\(user.name) \(user.surname)"
        newsTextLabel.text = news.text
        newsTextLabel.sizeToFit()
        
        if let newsImage = news.image {
            newsImageView.image = newsImage
        }
        
        actionCountLabels[likeCountLabel].text = String(news.likeCount)
        actionCountLabels[commentCountLabel].text = String(news.commentCount)
        actionCountLabels[repostCountLabel].text = String(news.respostCount)
    }
    
}
