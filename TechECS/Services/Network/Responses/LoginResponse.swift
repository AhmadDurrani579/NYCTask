//
//  LoginResponse.swift
//

import Foundation


struct NYTime : Response {
    
   var status: String?
    var copyright: String?
    var data: ResponseOfNYTime?

    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case data = "response"

    }
    
}


struct ResponseOfNYTime : Codable {
    
    var doctLit : [DocsNYTIME]?
    
    enum CodingKeys: String, CodingKey {
        case doctLit = "docs"
    }
    
}


struct DocsNYTIME : Codable {
    var web_url: String?
    var snippet: String?
    var lead_paragraph: String?
    var abstract: String?
    var print_page: String?
    var source: String?
    var keywords : [KeywordsList]?
    var pub_date : String?
    var document_type : String?
    var news_desk : String?
    var section_name : String?
    var type_of_material : String?
    var _id : String?
    var word_count : Int?
    var uri : String?
    
    enum CodingKeys: String, CodingKey {
        case web_url = "web_url"
        case snippet = "snippet"
        case lead_paragraph = "lead_paragraph"
        case abstract = "abstract"
        case print_page = "print_page"
        case source = "source"
        case keywords = "keywords"
        case pub_date = "pub_date"
        case document_type = "document_type"
        case news_desk = "news_desk"
        case section_name = "section_name"
        case type_of_material = "type_of_material"
        case _id = "_id"
        case word_count = "word_count"
        case uri = "uri"


    }
    
}

struct KeywordsList : Codable {
    var name: String?
    var value: String?
    var rank: Int?
    var major: String?
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case rank = "rank"
        case major = "major"
    }
    
}
