//
//  ViewController.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 26/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let repositoryManager = RepositoryManager()
    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadData() {
        RepositoryManager().repositories(success: { (repositories) in
            self.repositories.append(contentsOf: repositories)
            self.tableView.reloadData()
        }) { (error) in
            
        }
    }

}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "RepositoryCell")!
        
        cell.textLabel?.text = repositories[indexPath.row].name
        
        return cell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    
}

