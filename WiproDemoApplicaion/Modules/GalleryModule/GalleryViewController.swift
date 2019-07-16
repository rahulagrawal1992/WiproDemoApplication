//
//  GalleryViewController.swift
//  WiproDemoApp
//
//  Created by Rahul Agrawal on 15/07/19.
//  Copyright © 2019 Rahul Agrawal. All rights reserved.
//

import UIKit
import Foundation

class GalleryViewController: UITableViewController {
    
    let cellId = "cellId"
    var viewModel: GalleryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register tableview cell
        tableView.register(RecordCell.self, forCellReuseIdentifier: cellId)
        
        
        viewModel = GalleryViewModel(dataUpdatedAction: {[weak self] in
            self?.tableView.reloadData()
        })
        
        addRefreshController()
        
        //Get data from server
        //Add Spiner
        Spinner.start()
        viewModel.getDataFromApi(completion: {[weak self] in
            //Remove Spinner
            Spinner.stop()
            self?.refreshControl?.endRefreshing()
            self?.title = self?.viewModel.getTitle()
        })
    }
    
    func addRefreshController(){
        self.refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl?.attributedTitle = NSAttributedString(string: "Fetching Table Data ...", attributes: nil)
        self.refreshControl?.addTarget(self, action: #selector(refreshTableData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshTableData(_ sender: Any) {
        // Fetch Table Data
        fetchTableData()
    }
    
    private func fetchTableData() {
        
        viewModel.getDataFromApi(completion: {[weak self] in
            self?.title = self?.viewModel.getTitle()
            self?.refreshControl?.endRefreshing()
        })
    }
}

extension GalleryViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getData().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecordCell
        cell.row = viewModel.getData()[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
