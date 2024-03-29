//
//  NetworkLayer.swift
//

import Foundation

struct NetworkLayer {
    struct NetworkLayerError: LocalizedError {
        let message: String
        var errorDescription: String? {
            return message
        }
        var localizedDescription: String {
            return message
        }
    }
    
    static func fetch<D: Response>(_ endpoint: Endpoint, with: D.Type, handler: ((Result<D, NetworkLayerError>) -> ())? = nil) {
        var components = URLComponents(string: endpoint.fullUrl)
        guard let url = components?.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        switch endpoint.contentType {
        case .form:
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            var data = [String]()
            for (key, value) in endpoint.body {
                data.append("\(key)=\(value)")
            }
            let body = data.compactMap(({ String($0) })).joined(separator: "&")
            request.httpBody = body.data(using: .ascii)
        }
        
        func handle(_ result: Result<D,NetworkLayerError>, _ delay: TimeInterval = 0) {
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay, execute: {
                handler?(result)
            })
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                handle(.failure(.init(message: "Your Network appears to be offline")), 1)
            }
            
            guard let data = data else {
                handle(.failure(.init(message: "Something went wrong")))
                return
            }
            
//            let dataString = String(data: data, encoding: .utf8)
//            print(dataString as Any)
            guard let object = try? JSONDecoder().decode(with, from: data) else {
                handle(.failure(.init(message: "Could not parse data")))
                return
            }
            
//            object.process()
            handle(.success(object))
        }
        
        dataTask.resume()
    }
    
}
