//
//  HomeViewController.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 30/04/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit
import RevealingSplashView

class HomeViewController: UIViewController {
    
    private var lastContentOffset: CGFloat = 0
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var userCircleView: UIView! {
        didSet {
            userCircleView.layer.cornerRadius = userCircleView.frame.width / 2
            userCircleView.layer.borderColor = UIColor.clear.cgColor
            userCircleView.layer.borderWidth = 1
            
            userCircleView.addShadow()
            
        }
    }
    
    @IBOutlet weak var instantView: UIView! {
        didSet {
            instantView.addBorder()
            instantView.addShadow()
        }
    }
    
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
            adCollectionViewCell.delegate = self
            adCollectionViewCell.dataSource = self
        }
    }
    
    @IBOutlet weak var workerTableView: UITableView! {
        didSet {
            workerTableView.delegate = self
            workerTableView.dataSource = self
            
            let cell = UINib.init(nibName: "WorkerCell", bundle: nil)
            workerTableView.register(cell, forCellReuseIdentifier: "workerCell")
        }
    }
    
    
    @IBOutlet weak var workerTableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var floatingHeaderView: UIView! {
        didSet {
            floatingHeaderView.addShadow()
        }
    }
    @IBOutlet weak var floatingHeaderViewConstraint: NSLayoutConstraint! {
        didSet {
            floatingHeaderViewConstraint.constant = 0
        }
    }
    @IBOutlet weak var floatingInstantView: UIView! {
        didSet {
            floatingInstantView.addBorder()
            floatingInstantView.addShadow()
        }
    }
    
    @IBOutlet weak var floatingUserCircleView: UIView! {
        didSet {
            floatingUserCircleView.layer.cornerRadius = floatingUserCircleView.frame.width / 2
            floatingUserCircleView.layer.borderColor = UIColor.clear.cgColor
            floatingUserCircleView.layer.borderWidth = 1
            
            floatingUserCircleView.addShadow()
            
        }
    }
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.defaultStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let splashView = RevealingSplashView(iconImage: UIImage(named: "icon_logo")!, iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor.white)
        
        splashView.duration = 1.8
        splashView.animationType = .swingAndZoomOut
        self.view.addSubview(splashView)
        
        splashView.startAnimation {
            self.workerTableView.reloadData()
            DispatchQueue.main.async {
                self.workerTableViewHeightConstraint.constant = self.workerTableView.contentSize.height
            }
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToList" {
            if let listVC = segue.destination as? ListMariaViewController, let service = sender as? Service, let serviceType = service.serviceType {
                let filteredMarias = marias.filter{ $0.services.contains(serviceType)}
                listVC.selectWorkers = filteredMarias
                listVC.selectServices.append(service)
            }
        }
        
        if segue.identifier == "segueToDetail" {
            if let detailVC = segue.destination as? DetailMariaViewController, let maria = sender as? Worker {
                detailVC.worker = maria
            }
        }
    }
    
    @IBAction func configActionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToConfig", sender: nil)
    }
    
    
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return banners.count
        }
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            cell.addBorderOnCell()
            cell.addShadowOnCell()
            cell.bannerImageView.image = banners[indexPath.row]
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceCell", for: indexPath) as? ServiceCollectionViewCell else { return UICollectionViewCell()}
        
        cell.addBorderOnCell(color: UIColor.orange.sunset)
        cell.addShadowOnCell(color: UIColor.orange.sunset)
        
        let service = services[indexPath.row]
        cell.configCell(service: service)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            let service = services[indexPath.row]
            self.performSegue(withIdentifier: "segueToList", sender: service)
        }
    }
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workerCell", for: indexPath) as? WorkerTableViewCell else { return UITableViewCell() }
        cell.cardView.addBorder(color: UIColor.orange.sunset)
        cell.cardView.addShadow()
        
        let worker = marias[indexPath.row]
        cell.configCell(worker: worker)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let worker = marias[indexPath.row]
        
        self.performSegue(withIdentifier: "segueToDetail", sender: worker)
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            if scrollView.contentOffset.y >= serviceCollectionView.center.y {
                UIView.animate(withDuration: 0.3) {
                    self.floatingHeaderViewConstraint.constant = 60
                    self.view.layoutIfNeeded()
                    self.view.updateConstraints()
                }
            }
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            UIView.animate(withDuration: 0.3) {
                self.floatingHeaderViewConstraint.constant = 0
                self.view.layoutIfNeeded()
                self.view.updateConstraints()
            }
        }
        
        if (scrollView.contentOffset.y == self.headerView.center.y + 30) {
            
            UIView.animate(withDuration: 0.3) {
                self.floatingHeaderViewConstraint.constant = 0
                self.view.layoutIfNeeded()
                self.view.updateConstraints()
            }
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
}



