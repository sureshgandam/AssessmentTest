//
//  NewsModel.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import Foundation
import UIKit


struct NewsModel: Codable {
    
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
    
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try values.decodeIfPresent([Articles].self, forKey: .articles)
    }
    
    
    
    struct Articles: Codable {
        
        var source: Source?
        var author: String?
        var title: String?
        var description: String?
        var url: String?
        var urlToImage: String?
        var publishedAt: String?
        var content: String?
        
        private enum CodingKeys: String, CodingKey {
            case source = "source"
            case author = "author"
            case title = "title"
            case description = "description"
            case url = "url"
            case urlToImage = "urlToImage"
            case publishedAt = "publishedAt"
            case content = "content"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            source = try values.decodeIfPresent(Source.self, forKey: .source)
            author = try values.decodeIfPresent(String.self, forKey: .author)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
            publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
            content = try values.decodeIfPresent(String.self, forKey: .content)
        }
        struct Source: Codable {
            
            var id: String?
            var name: String?
            
            private enum CodingKeys: String, CodingKey {
                case id = "id"
                case name = "name"
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
            }
            
        }
    }
    
}
