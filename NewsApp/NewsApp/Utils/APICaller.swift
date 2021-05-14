//
//  APICaller.swift
//  NewsApp
//
//  Created by JEONGSEOB HONG on 2021/05/14.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-04-14&sortBy=publishedAt&apiKey=63a700b5a752493bb6665bf99dda23bc")
        static let searchUrlString = "https://newsapi.org/v2/everything?from=2021-04-14&sortBy=publishedAt&apiKey=63a700b5a752493bb6665bf99dda23bc&q="
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else { return }
        
        fetchData(byUrl: url, completion: completion)
    }
    
    public func search(with query: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let urlString = Constants.searchUrlString + query
        guard let url = URL(string: urlString) else { return }
        
        fetchData(byUrl: url, completion: completion)
    }
    
    private func fetchData(byUrl url: URL, completion: @escaping (Result<[Article], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))

                } catch {
                    completion(.failure(error))
                }

            }
        }
        task.resume()
    }

}

