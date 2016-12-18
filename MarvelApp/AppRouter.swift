//
//  AppRouter.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import UIKit

final class AppRouter {
    
    private var window: UIWindow
    private var navigationController: UINavigationController
    
    private var appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?
    
    private lazy var client: MarvelClient = MarvelClient()
    private lazy var storage: StorageController = StorageController()
    
    private lazy var provider: DataProvider = {
        return DataProvider(client: self.client, storage: self.storage)
    }()
    
    init(appLaunchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        self.appLaunchOptions = appLaunchOptions
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.navigationController = UINavigationController()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showInitialViewController() {
        let controller = SearchCharactersViewController(provider: self.provider, delegate: self)
        navigationController.viewControllers = [controller]
    }
    
    func showCharacterDetailViewController(for character: Character, from presentingViewController: UIViewController? = nil) {
        let controller = CharacterDetailViewController(provider: self.provider, character: character)
        
        if let presentingViewController = presentingViewController {
            let modalContainer = ModalContainerViewController(rootViewController: controller)
            presentingViewController.present(modalContainer, animated: true, completion: nil)
        } else {
            navigationController.pushViewController(controller, animated: true)
        }
    }
}

extension AppRouter : CharacterTableViewControllerDelegate {
    
    func charactersTableViewController(_ controller: CharacterTableViewController, didSelect character: Character) {
        if controller is SearchCharactersViewController {
            showCharacterDetailViewController(for: character)
        }
    }
}

