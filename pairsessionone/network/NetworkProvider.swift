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
    var path: String { get }
    var header: [String: String]? { get }
    var method: HTTPMethod { get }
    var params:  [URLQueryItem] { get }
    var host: String { get }
    var scheme: String { get }
}

enum MusicProvider: EndpointType {
    
    case searchMusic(query: String)
    
    var scheme: String {
        switch self {
        case .searchMusic(_):
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .searchMusic(_):
            return "itunes.apple.com"
        }
    }
    
    var path: String {
        switch self {
        case .searchMusic(_):
            return "/search"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: [String: String]? {
        return nil
    }
    
    var params: [URLQueryItem] {
        switch self {
        case .searchMusic(let searchQuery):
            return [URLQueryItem(name: "term", value: searchQuery),
                    URLQueryItem(name: "mediaType", value: "music"),
                    URLQueryItem(name: "limit", value: "20")]
        }
    }
}
