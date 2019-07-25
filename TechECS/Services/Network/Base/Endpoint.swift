//
//  Endpoint.swift
//

import Foundation

enum HTTPMethod: String {
    case get, post, put, update, delete
}

enum HTTPContentType {
    case form, json, multipart
}

typealias HTTPParameters = [String: String]

struct HTTPMultipart {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
}

protocol Endpoint {
    var baseUrl: String { get }
    var fullUrl: String { get }
    var path: String { get }
    var query: HTTPParameters { get }
    var body: HTTPParameters { get }
    var multipart: [HTTPMultipart] { get }
    var method: HTTPMethod { get }
    var contentType: HTTPContentType { get }
}

extension Endpoint {
    var baseUrl: String {
        return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/%7Bsection%7D/%7Bperiod%7D.json?api-key="
    }
    
    
    
    var fullUrl: String {
        return "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=PANwDyQltdbj1Rogs7l3TTZxtrx8N8Ky"
    }
    
    var query: HTTPParameters {
        return HTTPParameters()
    }
    
    var body: HTTPParameters {
        return HTTPParameters()
    }
    
    var multipart: [HTTPMultipart] {
        return []
    }
}
