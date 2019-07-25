//
//  Response.swift
//

import Foundation

protocol Response: Codable {
    var status: String? { get }
    var copyright: String? { get }

}



