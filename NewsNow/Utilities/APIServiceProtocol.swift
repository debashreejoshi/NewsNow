//
//  APIServiceProtocol.swift
//  NewsNow
//
//  Created by Debashree Joshi on 22/4/2023.
//

import Foundation

protocol APIServiceProtocol {
    func fetchArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void)
}

class APIService: APIServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void) {
        guard let url = URL(string: "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full") else {
            completion(.failure(APIError.invalidEndpoint))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let articles = try decoder.decode(ArticleResponse.self, from: data)
                completion(.success(articles))
            } catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError)")
                completion(.failure(APIError.decodingError))
            }
        }
        
        task.resume()
    }
}

enum APIError: Error {
    case invalidEndpoint
    case invalidResponse
    case decodingError
}
