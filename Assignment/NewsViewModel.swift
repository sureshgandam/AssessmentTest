//
//  NewsViewModel.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import Foundation
import UIKit


class NewsViewModel: NSObject {
    
    var model: NewsModel?
    var apiKey = "4ace9900217a4544bd2274b41e7bb9cb"
    
    func getApiCall( completion: @escaping (String)->Void) {
        if let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-03-12&sortBy=publishedAt&apiKey=\(apiKey)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(error.localizedDescription)
                } else if let data = data {
                    do {
                        self.model = try JSONDecoder().decode(NewsModel.self, from: data)
                        completion("success")
                    }catch {
                        print("Error: \(error.localizedDescription)")
                        completion(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
