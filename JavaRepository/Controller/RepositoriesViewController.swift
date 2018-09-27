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
    
    fileprivate let segueDetailIdentifier = "RepositoryDetailSegue"
    
    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case segueDetailIdentifier:
            if let destination = segue.destination as? RepositoryDetailViewController
                , let indexPath = sender as? IndexPath {
                destination.repository = repositories[indexPath.row]
            }
        default:
            break
        }
    }
    
    func setupValues() {
        DataManager.repositories(success: { (repositories) in
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueDetailIdentifier, sender: indexPath)
    }
}

