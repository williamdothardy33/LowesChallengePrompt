//
//  SearchViewControllerEXT.swift
//  MovieBrowser
//
//  Created by developer on 6/12/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.vm.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieTableViewCell else {
            print("couldn't get a cell")
            return UITableViewCell()
        }
        
        guard let cellVM = self.vm.movies?[indexPath.row]
               else
               {
                   print("couldn't get a cellVM")
                   return UITableViewCell()
               }
        cell.accessoryType = .disclosureIndicator
        cell.configure(vm: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        guard let navController = self.navigationController else {
            return
        }
        
        let vc = sb.instantiateViewController(withIdentifier: "DetailsVC") as! MovieDetailViewController
        let row = indexPath.row
        guard let movies = self.vm.movies else {
            return
        }
        
        let vm = movies[row]
        
        vc.vm = vm
        
        navController.show(vc, sender: nil)
    }
}

extension SearchViewController {
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieCell")

    }
}

extension SearchViewController {
    func addSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let totalPages = self.vm.totalPages, let page = self.vm.page, (page >= totalPages) || self.vm.isFetching
         {
            return
            
        }
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height - 100 - scrollView.frame.size.height {
            self.tableView.tableFooterView = addSpinnerFooter()
            getNextPage()
        }
    }
}
