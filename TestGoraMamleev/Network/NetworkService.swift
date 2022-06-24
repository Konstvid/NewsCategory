//
//  NetworkService.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import Foundation

class NetworkService {
    
    func getNews(completion: @escaping NewsResponseCompletion) {
        getRequest(URLString: baseNewsURL + accessKey) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(jsonData))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

extension NetworkService {
    
    private func getRequest(URLString: String, completion: @escaping ResultCompletion) {
        guard let url = URL(string: URLString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
