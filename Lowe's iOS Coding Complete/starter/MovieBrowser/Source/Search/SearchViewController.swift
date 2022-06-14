//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var queryResource: MoviesResource?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchField: UISearchBar!
    
    @IBAction func handleSearch(_ sender: UIButton) {
        let query = self.searchField.text
        if let query = query {
            queryMovieList(query: query)
        }
    }
    
    func queryMovieList(query: String) {
        self.vm.isFetching = false
        self.vm.queryResource = MoviesResource().addQueryParameter(key: "query", value: query).addQueryParameter(key: "page", value: "1")
    }
    
    func getNextPage() {
        if let page = self.vm.page, let resource = self.vm.queryResource,let totalPages = self.vm.totalPages, totalPages > page {
            let nextResource = resource.addQueryParameter(key: "page", value: "\(page + 1)")
            self.vm.pageResource = nextResource
        }
    }
    
    var vm = MoviesVM()
    
    override func viewDidLoad() {
        self.configureTable()
        
        self.vm.handleModelChange = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.tableFooterView = nil
            }
        }
    }
}
