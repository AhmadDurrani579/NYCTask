//
//  AuthEndpoint.swift
//

import Foundation
import UIKit

enum AuthEndpoint : Endpoint {
    
    case NYTime

    var path: String {
        switch self {
        case .NYTime:
            return "PANwDyQltdbj1Rogs7l3TTZxtrx8N8Ky"
        }
        
    }

    var method: HTTPMethod {
        switch self {
        case .NYTime:
            return .get
            
        }
    }
    
    var contentType: HTTPContentType {
        switch self {
        default:
            return .form
        }
    }
    var body: HTTPParameters {
        let body = HTTPParameters()
        
        switch self {
        default:
            break
        }
        return body
    }

    var multipart: [HTTPMultipart] {
        let multipart: [HTTPMultipart] = []
        switch self {

        default:
            break
        }
        return multipart
    }
}

