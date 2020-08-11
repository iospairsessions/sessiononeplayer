//
//  NetworkLayer.swift
//  pairsessionone
//
//  Created by Jesus Parada on 10/08/20.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation

class NetworkLayer {
    class func request<T: Codable>(provider: MusicProvider, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = provider.scheme
        components.host = provider.host
        components.path = provider.path
        components.queryItems = provider.params
        
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = provider.method.rawValue
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            let responseObject = try! JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}
