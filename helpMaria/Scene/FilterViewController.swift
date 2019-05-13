//
//  FilterViewController.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 12/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    var selectService: [Service] = []
    var delegate: Filter?
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func aplyFilterAction(_ sender: Any) {
        delegate?.apply(services: selectService)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceFilterCell", for: indexPath) as? ServiceFilterCollectionViewCell else { return UICollectionViewCell() }
        
        let service = services[indexPath.row]
        cell.configCell(service: service)
        cell.addBorderOnCell(color: UIColor.orange.sunset)
        cell.addShadowOnCell()
        
        if selectService.contains(where: { $0.serviceType == service.serviceType }) {
            cell.select()
        } else {
            cell.deselect()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let service = services[indexPath.row]
        if selectService.contains(where: {$0.serviceType == service.serviceType}) {
            selectService.removeAll(where: {$0.serviceType == service.serviceType })
        } else {
            selectService.append(service)
            
        }
        collectionView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: 80)
    }
}


