//
//  ModalContainerViewController.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit

class ModalContainerViewController: UINavigationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done(_:)))
        topViewController?.navigationItem.rightBarButtonItem = doneItem
    }
    
    @objc private func done(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
    
}
