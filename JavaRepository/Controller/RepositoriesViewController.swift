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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate let segueDetailIdentifier = "RepositoryDetailSegue"
    
    var manager = RepositoryManager()
    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
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
    
    func setupData() {
        repositories.removeAll()
        manager.incrementPage()
    }
    
    func setupValues() {
        activityIndicator.startAnimating()

        ServiceManager.repositories(page: manager.page, success: { (repositories) in
            self.repositories.append(contentsOf: repositories)
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.manager.incrementPage()
        }) { (error) in
            self.activityIndicator.stopAnimating()
        }
    }

    @IBAction func refresh(_ sender: Any) {
        setupValues()
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableView.isHidden = repositories.count == 0
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "RepositoryCell")!
        
        cell.textLabel?.text = repositories[indexPath.row].name
        
        cell.detailTextLabel?.text = repositories[indexPath.row].owner.login

        return cell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueDetailIdentifier, sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // Add data
        if indexPath.row + 1 == repositories.count {
            setupValues()
        }
    }
}

