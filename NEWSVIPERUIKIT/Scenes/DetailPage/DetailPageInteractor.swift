//
//  DetailPageInteractor.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.


import UIKit

protocol DetailPageBusinessLogic
{
    func loadViews()
}

protocol DetailPageDataStore
{
    var selectedArticle: Home.News.Article?  { get set }
}

class DetailPageInteractor: DetailPageBusinessLogic, DetailPageDataStore
{
    var presenter: DetailPagePresentationLogic?
    var selectedArticle: Home.News.Article?
    
    func loadViews(){
        if let selectedArticle = selectedArticle {
            let keyValueArticleFeature = convertToKeyValueArray(article: selectedArticle)
            presenter?.presentPrepareDataSource(articles: keyValueArticleFeature)
        }
    }
    
    func convertToKeyValueArray(article: Home.News.Article) -> [[String: Any]] {
        var keyValueArray: [[String: Any]] = []
        
        let mirror = Mirror(reflecting: article)
        
        for case let (label?, value) in mirror.children {
            keyValueArray.append([label: value])
        }
        
        return keyValueArray
    }
}
