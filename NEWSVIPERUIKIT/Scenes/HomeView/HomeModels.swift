//
//  HomeModels.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.

import UIKit

enum Home
{
    
    enum News
    {
        // MARK: - News
        struct Response: Codable {
            var articles: [Article]?
        }
        
        // MARK: - Article
        struct Article: Codable {
            let source: Source?
            let author: String?
            let title: String?
            let description: String?
            let url: String?
            let urlToImage: String?
            let publishedAt: String?
            let content: String?
        }
        
        // MARK: - Source
        struct Source: Codable {
            let id: String?
            let name: String?
        }
    }
}
