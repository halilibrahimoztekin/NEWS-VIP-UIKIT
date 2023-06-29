//
//  HomeInteractor.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

protocol HomeBusinessLogic
{
    func fetchNews()
    func setSelectArticle(indexPath: IndexPath)
}

protocol HomeDataStore
{
    var page: Int { get set }
    var articles: [Home.News.Article]? { get set }
    var selectedArticle: Home.News.Article?  { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var presenter: HomePresentationLogic?
    var page: Int = 1
    var articles: [Home.News.Article]?
    var selectedArticle: Home.News.Article?
    
    
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
                self?.presenter?.presentAlert(title: failure.localizedDescription,
                                              message: String(describing: failure),
                                              actions:[])
            }
        }
    }
    
    func setSelectArticle(indexPath: IndexPath) {
        selectedArticle = articles?[indexPath.row]
        self.presenter?.presentDetailPage()
    }
    
}
