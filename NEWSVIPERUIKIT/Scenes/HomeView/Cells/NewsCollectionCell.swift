//
//  NewsCollectionCell.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import UIKit

class NewsCollectionCell: UICollectionViewCell,ConfigurableCell {
    
    @IBOutlet var newsImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    func configure(_ item: Home.News.Article, at indexPath: IndexPath) {
        
        let viewModel = item
        newsImageView.image = .actions
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.publishedAt
    }
    
    
}
