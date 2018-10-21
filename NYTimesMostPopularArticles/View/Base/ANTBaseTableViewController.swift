//
//  ANTBaseTableViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit

class ANTBaseTableViewController: UITableViewController {

    
    var viewModels : [ANTArticleViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ANTArticleTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ANTArticleTableViewCell.self.self))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ANTArticleTableViewCell.self.self)) as? ANTArticleTableViewCell
        let viewModel: ANTArticleViewModel? = viewModels[indexPath.row]
        cell?.configure(with: viewModel)
        
        return cell!
    }
}



