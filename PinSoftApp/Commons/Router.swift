//
//  Router.swift
//  PinSoftApp
//
//  Created by Piksel on 19.12.2021.
//

import UIKit

final class Router {
    static func showDetailPage(_ navigationController: UINavigationController?, id: String) {
        let viewController = DetailVC.instantiate()
        let viewModel = DetailVM(id: id)
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    static func pushView(_ navigationController: UINavigationController?){
        let viewController = MainVC.instantiate()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
