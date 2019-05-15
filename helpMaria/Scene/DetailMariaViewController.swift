//
//  DetailMariaViewController.swift
//  helpMaria
//
//  Created by Alexandre Thadeu on 12/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit

class DetailMariaViewController: UIViewController {
    var worker: Worker?
    var workerServices: [Service] = []
    
    @IBOutlet weak var workerNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.defaultStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func config() {
        guard let worker = worker else { return }
        
        workerNameLabel.text = worker.name
        ratingLabel.text = "avaliação \(worker.rate ?? 5.0)"
        
        for serviceType in worker.services {
            for service in services {
                if service.serviceType == serviceType {
                    workerServices.append(service)
                }
            }
        }
        
        self.collectionView.reloadData()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func contractAction(_ sender: Any) {
        let alert = UIAlertController(title: "Contratar serviço", message: "Por favor selecione um serviço", preferredStyle: .actionSheet)
        
        for service in workerServices  {
            let action = UIAlertAction(title: service.name, style: .default) { (UIAlertAction) in
                self.performSegue(withIdentifier: "segueToCheckout", sender: nil)
            }
            alert.addAction(action)
        }
        let cancel = UIAlertAction(title: "cancelar", style: .cancel) { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

extension DetailMariaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workerServices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serviceDetailCell", for: indexPath) as? ServiceDetailCollectionViewCell else { return UICollectionViewCell() }
        
        let service = workerServices[indexPath.row]
        cell.configCell(service:service)
        cell.addBorderOnCell(color: UIColor.orange.sunset)
        cell.addShadowOnCell(color: UIColor.orange.sunset)
        
        return cell
    }
    
    
}
