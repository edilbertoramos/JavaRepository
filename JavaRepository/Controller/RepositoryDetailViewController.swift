//
//  RepositoryDetailViewController.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var repository: Repository?

    var pulls = [Pull]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupValues() {
        guard let repository = repository else { return }
        title = repository.name

        activityIndicator.startAnimating()
        ServiceManager.pulls(repository, success: { (pulls) in
            self.pulls = pulls
            self.tableView.reloadData()
            self.tableView.isHidden = self.pulls.count == 0
            self.activityIndicator.stopAnimating()

        }) { (error) in
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        setupValues()
    }

}

extension RepositoryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pulls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "PullCell")!
        
        cell.detailTextLabel?.text = pulls[indexPath.row].title
        cell.textLabel?.text = pulls[indexPath.row].user.login

        return cell
    }
}
