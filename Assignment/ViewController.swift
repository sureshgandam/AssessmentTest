//
//  ViewController.swift
//  Assignment
//
//  Created by Suresh Gandam on 11/04/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    /// initialise variables
    @IBOutlet weak var tableView: UITableView!
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsApiCall()
    }
    
    func getNewsApiCall() {
        viewModel.getApiCall { status in
            if status == "success" {
                DispatchQueue.main.async { [self] in
                    tableView.delegate = self
                    tableView.dataSource = self
                    tableView.reloadData()
                }
            }
        }
    }
}

//MARK: - TableView Delegate And DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell") as! NewsTableCell
        let model = viewModel.model?.articles?[indexPath.row]
        cell.titleLabel.text = model?.title
        cell.imageVw.kf.setImage(with: URL(string: model?.urlToImage ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailNewsController") as! DetailNewsController
        let model = viewModel.model?.articles?[indexPath.row]
        vc.selectedModel = model
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - News TableCell
class NewsTableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
}
