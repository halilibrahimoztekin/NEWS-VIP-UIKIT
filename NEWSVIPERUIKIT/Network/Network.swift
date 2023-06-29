//
//  Network.swift
//  NEWSVIPERUIKIT
//
//  Created by Halil İbrahim Öztekin on 29.06.2023.
//

import Foundation
import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidData
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func request<T: Decodable>(with requestType : RequestType, parameters: [String: Any]? = nil, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = requestType.endPoint else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = requestType.httpMethod.rawValue
        
        if request.httpMethod == HttpMethod.POST.rawValue {
            if let parameters = parameters {
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.invalidData))
            }
        }

        task.resume()
    }
}
