//
//  DetailNewsController.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import UIKit

class DetailNewsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedModel: NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedModel?.image
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
        cell.textLabel?.text = selectedModel?.newsStory
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
