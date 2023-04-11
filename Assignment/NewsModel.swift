//
//  NewsModel.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import Foundation
import UIKit

class NewsModel {
    var newsStory: String
    var image: UIImage
    
    init(newsStory: String, image: UIImage) {
        self.newsStory = newsStory
        self.image = image
    }
}
