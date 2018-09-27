//
//  RepositoryDetailViewController.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    var repository: Repository?

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

        DataManager.pulls(repository, success: { (pulls) in
            print(pulls)
        }) { (error) in
        }
    }

}
