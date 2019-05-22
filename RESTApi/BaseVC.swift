//
//  BaseVC.swift
//  RESTApi
//
//  Created by Maxim Vitovitsky on 21/05/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    var navigationIsHidden: Bool {
        return false
    }
    var prefersLargeTitles: Bool {
        return true
    }
    var barTitnColor: UIColor {
        return .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBarSetHidden(navigationIsHidden)
    }
    
    public func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = barTitnColor
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
    }
    
    public func navigationBarSetHidden(_ isHidden: Bool) {
        if isHidden {
            navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
        
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
}
