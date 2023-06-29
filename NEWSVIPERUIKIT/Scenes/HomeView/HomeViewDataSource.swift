//
//  HomeViewDataSource.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation
class NewsDataSource: CollectionArrayDataSource<Home.News.Article, NewsCollectionCell> {}
class NewsDetailDataSource: CollectionArrayDataSource<[String : Any], DetailPageCollectionViewCell> {
    
}
