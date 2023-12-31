//
//  HomePresenter.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

protocol HomePresentationLogic
{
    func presentPrepareDataSource(articles: [Home.News.Article]?)
    func presentDetailPage()
    func presentAlert(title: String?, message: String?, actions: [AlertAction])
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
    func presentPrepareDataSource(articles: [Home.News.Article]?) {
        self.viewController?.displayPrepareCollectionView(articles: articles)
    }
    
    func presentDetailPage() {
        self.viewController?.displayNavigateNewsDetail()
    }
  
    func presentAlert(title: String?, message: String?, actions: [AlertAction] = []) {
        self.viewController?.displayAlert(title: title, message: message, actions: actions)
    }
  
}
