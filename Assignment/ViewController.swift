//
//  ViewController.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import UIKit

class ViewController: UIViewController {

    /// initialise variables
    @IBOutlet weak var tableView: UITableView!
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.prepareNewsData { modelArray in
            DispatchQueue.main.async { [self] in
                tableView.delegate = self
                tableView.dataSource = self
                tableView.reloadData()
            }
        }
    }
}

//MARK: - TableView Delegate And DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell") as! NewsTableCell
        let model = viewModel.model[indexPath.row]
        cell.titleLabel.text = model.newsStory
        cell.imageVw.image = model.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailNewsController") as! DetailNewsController
        vc.selectedModel = viewModel.model[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - News TableCell
class NewsTableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
}
