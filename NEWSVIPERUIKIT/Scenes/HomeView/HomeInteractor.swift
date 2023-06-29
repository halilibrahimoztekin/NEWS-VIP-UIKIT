//
//  HomeInteractor.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic
{
    func fetchNews()
}

protocol HomeDataStore
{
    var page: Int { get set }
    var articles: [Home.News.Article]? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var presenter: HomePresentationLogic?
    var page: Int = 1
    var articles: [Home.News.Article]?
    
    
    func fetchNews() {
        NetworkManager.shared.request(with: .search(page: page)) { [weak self] (response : Result<Home.News.Response, NetworkError>) in
            switch response {
            case .success(let news):
                if self?.articles != nil {
                    if let articles = news.articles {
                        self?.articles! += articles
                    }
                }
                else {
                    self?.articles = news.articles
                }
                self?.presenter?.presentPrepareDataSource(articles: self?.articles)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
