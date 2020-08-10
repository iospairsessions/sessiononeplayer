//
//  NetworkProvider.swift
//  pairsessionone
//
//  Created by Andres Rivas on 04-08-20.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol EndpointType {
    var path: URL? { get }
    var header: [String: String]? { get }
    var method: HTTPMethod { get }
    var params: [String: Any?]? { get }
}

extension EndpointType {
    var method: HTTPMethod {
        return .get
    }
    
    var header: [String: String]? {
        return nil
    }
    
    var params: [String: Any?]? {
        return nil
    }
}


enum MusicEndpoint {
    case searchPath(searchTerm: String)
}

protocol NetworkProviderProtocol {
    func getSearchURL(searchQuery: String) -> URL?
}

class NetworkProvider {
    
    typealias SuccessResult = (SearchResult) -> Void
    typealias ErrorResult = (Error?) -> Void
    
    func getTestData(trackSearch: String, onSuccess: @escaping SuccessResult, onError: @escaping ErrorResult) {
        guard let url = getSearchURL(searchQuery: trackSearch) else {
            onError(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                let searchResult = try? JSONDecoder().decode(SearchResult.self, from: data) else {
                    onError(error)
                    return
            }
            onSuccess(searchResult)
        }
        task.resume()
    }
    
    func getSearchURL(searchQuery: String) -> URL? {
        let baseURL = "https://itunes.apple.com/search"
        var components = URLComponents(string: baseURL)
        components?.queryItems = [URLQueryItem(name: "term", value: searchQuery),
                                  URLQueryItem(name: "mediaType", value: "music"),
                                  URLQueryItem(name: "limit", value: "20")]
        return components?.url
    }
}
