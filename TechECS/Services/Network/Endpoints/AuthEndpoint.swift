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


//    var contentType: HTTPContentType {
//        switch self {
//        case .uploadDocument(_,_,_):
//            return .multipart
//        default:
//            return .form
//        }
//    }

//    var query: HTTPParameters {
//        var query = HTTPParameters()
//        switch self {
//        case .carTypes(let cityId):
//            query["city_id"] = cityId
//        case .carModels(let typeId):
//            query["car_type_id"] = typeId
//        case .onlineOffline(let isOnline):
//            query["online_offline"] = isOnline ? "1" : "2"
//            if let user: UserStruct = Persistence(with: .user).load() {
//                query["driver_id"] = user.id
//                query["driver_token"] = user.token
//            }
//        default:
//            break
//        }
//        return query
//    }

    var body: HTTPParameters {
        var body = HTTPParameters()
        
        switch self {
        default:
            break
        }
        return body
    }

    var multipart: [HTTPMultipart] {
        var multipart: [HTTPMultipart] = []
        switch self {

        default:
            break
        }
        return multipart
    }
}

