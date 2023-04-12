//
//  DetailNewsController.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import UIKit
import Kingfisher

class DetailNewsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedModel: NewsModel.Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.kf.setImage(with: URL(string: selectedModel?.urlToImage ?? ""))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}


//MARK: - TableView Delegate And DataSource
extension DetailNewsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = selectedModel?.description
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
