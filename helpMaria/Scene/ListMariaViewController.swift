//
//  ListMariaViewController.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 11/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class ListMariaViewController: UIViewController {
    
    var selectWorkers: [Worker] = []
    var selectServices: [Service] = []
    
    @IBOutlet weak var workerTableView: UITableView! {
        didSet {
            let cell = UINib(nibName: "WorkerCell", bundle: nil)
            workerTableView.register(cell, forCellReuseIdentifier: "workerCell")
            workerTableView.delegate = self
            workerTableView.dataSource = self
        }
    }
    
    @IBOutlet weak var workerTableVikewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var selectedServiceCollectionView: UICollectionView! {
        didSet {
            selectedServiceCollectionView.dataSource = self
            selectedServiceCollectionView.delegate = self
        
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.workerTableView.reloadData()
        DispatchQueue.main.async {
            self.workerTableVikewConstraint.constant = self.workerTableView.contentSize.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFilter" {
            if let filterVC = segue.destination as? FilterViewController {
                filterVC.selectService = selectServices
                filterVC.delegate = self
            }
        }
        
        if segue.identifier == "segueToDetail" {
            if let detailVC = segue.destination as? DetailMariaViewController, let maria = sender as? Worker {
                detailVC.worker = maria
            }
        }
    }

}
extension ListMariaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectServices.count > 0 {
            return selectWorkers.count
        }
        return marias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workerCell") as? WorkerTableViewCell else { return UITableViewCell()}
        
        if selectServices.count > 0 {
            cell.configCell(worker: selectWorkers[indexPath.row])
        } else {
            cell.configCell(worker: marias[indexPath.row])

        }
        
        cell.cardView.addBorder(color: UIColor.orange.sunset)
        cell.cardView.addShadow()
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var worker = marias[indexPath.row]
        if selectWorkers.count > 0 {
            worker = selectWorkers[indexPath.row]
        }
        performSegue(withIdentifier: "segueToDetail", sender:worker )

    }
    
}

extension ListMariaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectServices.count > 0 {
            return selectServices.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectServices.count > 0 {
            selectServices.remove(at: indexPath.row)
            self.selectedServiceCollectionView.reloadData()
            self.workerTableView.reloadData()
            
            DispatchQueue.main.async {
                self.workerTableVikewConstraint.constant = self.workerTableView.contentSize.height
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectServiceCell", for: indexPath) as? SelectServiceCollectionViewCell else { return UICollectionViewCell() }
        
        if selectServices.count > 0 {
            let service = selectServices[indexPath.row]
            cell.serviceNameLabel.text = service.resumeName
        }else {
            cell.serviceNameLabel.text = "todos"
            cell.closeIcon.isHidden = true
        }
        
        cell.addBorderOnCell()
        cell.addShadowOnCell()
        return cell
    }
    
}

extension ListMariaViewController: Filter {
    func apply(services: [Service]) {
        self.selectServices = services
        self.selectedServiceCollectionView.reloadData()
        
        var newMarias : [Worker] = []
        
        for service in services {
            let maria = marias.filter({ $0.services.contains(service.serviceType!)})
            newMarias.append(contentsOf: maria)
        }

        self.selectWorkers = newMarias.removeDuplicates()
    }
}
