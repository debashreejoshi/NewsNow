//
//  APIServiceProtocol.swift
//  NewsNow
//
//  Created by Debashree Joshi on 22/4/2023.
//

import Foundation

// Protocol that defines the API service contract
protocol APIServiceProtocol {
    func fetchArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void)
}

// API service implementation
class APIService: APIServiceProtocol {
    
    // URLSession used to make network requests
    private let session: URLSession
    
    static var baseURL: String {
        return "https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full"
    }
    
    // Initializer with default URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // Function that fetches articles from the API
    func fetchArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void) {
        // Creating URL from the base URL string
        guard let url = URL(string: APIService.baseURL) else {
            completion(.failure(APIError.invalidEndpoint))
            return
        }
        
        // Creating a data task with the URL session
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Checking the response status code
            guard let data = data, let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            do {
                // Decoding the JSON response to ArticleResponse object using JSONDecoder
                let decoder = JSONDecoder()
                let articles = try decoder.decode(ArticleResponse.self, from: data)
                completion(.success(articles))
            } catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError)")
                completion(.failure(APIError.decodingError))
            }
        }
        
        // Starting the task
        task.resume()
    }
}

// Possible errors returned by the API service
enum APIError: Error {
    case invalidEndpoint
    case invalidResponse
    case decodingError
}
