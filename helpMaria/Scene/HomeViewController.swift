//
//  HomeViewController.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let workersCount = 10
    let serviceCount = 5

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var serviceCollectionView: UICollectionView! {
        didSet {
            serviceCollectionView.tag = 0
            serviceCollectionView.dataSource = self
            serviceCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var adCollectionViewCell: UICollectionView! {
        didSet {
            adCollectionViewCell.tag = 1
        }
    }
    
    @IBOutlet weak var workerTableView: UITableView! {
        didSet {
            workerTableView.delegate = self
            workerTableView.dataSource = self
        }
    }
    @IBOutlet weak var workerTableViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.workerTableView.reloadData()
        DispatchQueue.main.async {
            self.workerTableViewHeightConstraint.constant = self.workerTableView.contentSize.height
        }
    }
    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serviceCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as? ServiceCollectionViewCell else { return UICollectionViewCell()}
        
        cell.addBorderOnCell()
        cell.addShadowOnCell()
        return cell
        
    }
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workersCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workerCell", for: indexPath) as? WorkerTableViewCell else { return UITableViewCell() }
        cell.cardView.addBorder()
        cell.cardView.addShadow()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    
}
