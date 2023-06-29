//
//  DetailPagePresenter.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

protocol DetailPagePresentationLogic
{
    func presentPrepareDataSource(articles: [[String : Any]]?)
    func presentAlert(title: String?, message: String?, actions: [AlertAction])
}

class DetailPagePresenter: DetailPagePresentationLogic
{
  weak var viewController: DetailPageDisplayLogic?
  
  // MARK: Do something
  
    func presentPrepareDataSource(articles: [[String : Any]]?) {
        self.viewController?.displayPrepareCollectionView(articles: articles)
    }
    
    func presentAlert(title: String?, message: String?, actions: [AlertAction] = []) {
        self.viewController?.displayAlert(title: title, message: message, actions: actions)
    }
}
