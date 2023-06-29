//
//  RequestType.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation

enum URLConstants  : String {
    case scheme = "https"
    case host = "newsapi.org"
    case path = "/v2/top-headlines"
    case country = "us"
    case apiKey = "d80445e104b541b7b84c369d1bbf9be4"
}
enum RequestType {
    case search(page : Int = 1)
    
    
    
    var endPoint : URL? {
        var components = URLComponents()
        components.scheme = URLConstants.scheme.rawValue
        components.host = URLConstants.host.rawValue
        components.path = URLConstants.path.rawValue
        
        
        switch self {
        case .search(let page):
            components.queryItems = [
                URLQueryItem(name: "country", value: URLConstants.country.rawValue),
                URLQueryItem(name: "pageSize", value: "20"),
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "Apikey", value: URLConstants.apiKey.rawValue)
            ]
            return components.url
        }
    }
    
    var httpMethod : HttpMethod {
        switch self {
        case .search(_):
            return .GET
        }
    }
}

enum HttpMethod : String {
    case GET
    case POST
}
