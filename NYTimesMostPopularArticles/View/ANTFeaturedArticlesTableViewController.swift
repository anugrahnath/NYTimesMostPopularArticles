//
//  ANTFeaturedArticlesTableViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit
import MBProgressHUD

class ANTFeaturedArticlesTableViewController: ANTBaseTableViewController, UISearchControllerDelegate, UISearchBarDelegate {

    
    var searchController: UISearchController?
    var resultsController: ANTBaseTableViewController?
    var pullToRefreshControl: UIRefreshControl?
    var detailController : ANTArticleDetailsViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        setup()
        fetchFeaturedArticles()
        setupSearchController()
    }

    func setup() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "The_New_York_Times_logo"))
        
        pullToRefreshControl = UIRefreshControl()
        pullToRefreshControl?.backgroundColor = UIColor.clear
        pullToRefreshControl?.beginRefreshing()
        pullToRefreshControl?.addTarget(self, action: #selector(ANTFeaturedArticlesTableViewController.fetchFeaturedArticles), for: .valueChanged)
        if let aControl = pullToRefreshControl {
            tableView.addSubview(aControl)
        }
    }
    
    @objc func fetchFeaturedArticles() {
        weak var weakSelf: ANTFeaturedArticlesTableViewController? = self
        ANTServices.sharedInstance.fetchFeaturedArticles(vc: self, completion: { articles in
            let viewModels = articles.map(_: { article in
                return ANTArticleViewModel(featuredArticle: article)
            })
            
            
            weakSelf?.viewModels = viewModels
            
           
            DispatchQueue.main.async(execute: {
                MBProgressHUD.hide(for: self.view, animated: true)
                
                weakSelf?.tableView.beginUpdates()
                weakSelf?.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .automatic)
                weakSelf?.tableView.endUpdates()
                weakSelf?.pullToRefreshControl?.endRefreshing()
            })
        })
    }

   func setupSearchController () {
    resultsController = ANTBaseTableViewController()
    searchController = UISearchController(searchResultsController: resultsController)
    resultsController?.tableView.delegate = self
    searchController?.delegate = self as? UISearchControllerDelegate
    searchController?.dimsBackgroundDuringPresentation = true
    searchController?.searchBar.delegate = self as? UISearchBarDelegate
    searchController?.searchBar.searchBarStyle = .minimal
    tableView.tableHeaderView = searchController?.searchBar
    definesPresentationContext = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        UIView.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(self.performDelayedSearch(_:)), with: searchText, afterDelay: 0.5)
    }
    
    @objc func performDelayedSearch(_ searchQuery: String?) {
        weak var weakSelf = self
        ANTServices.sharedInstance.searchArticles(query: searchQuery!) { articles in
            let viewModels = articles.map(_: { article in
                return ANTArticleViewModel(searchArticle: article)
            })
            DispatchQueue.main.async(execute: {
                weakSelf?.resultsController?.viewModels = viewModels
                weakSelf?.resultsController?.tableView.beginUpdates()
                weakSelf?.resultsController?.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .fade)
                weakSelf?.resultsController?.tableView.endUpdates()
            })
        }
    }
    
    // MARK: - UITableViewDelegate
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewModel: ANTArticleViewModel? = tableView == self.tableView ? viewModels[indexPath.row] : resultsController?.viewModels[indexPath.row]
    detailController = ANTArticleDetailsViewController()
    detailController?.viewModel = viewModel
    navigationController?.pushViewController(detailController!, animated: true)
    }
}
