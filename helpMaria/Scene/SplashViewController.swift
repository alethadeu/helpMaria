//
//  SplashViewController.swift
//  helpMaria
//
//  Created by Thais Ayumi on 05/05/19.
//  Copyright © 2019 Alexandre Thadeu. All rights reserved.
//

import UIKit
import RevealingSplashView

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let splashView = RevealingSplashView(iconImage: UIImage(named: "icon_logo")!, iconInitialSize: CGSize(width: 150, height: 150), backgroundColor: UIColor.white)
        
        splashView.animationType = .swingAndZoomOut
        self.view.addSubview(splashView)
        
        splashView.startAnimation {
            print("Complete")
            self.performSegue(withIdentifier: "segueToHome", sender: nil)
            
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
