//
//  ViewController.swift
//  PinSoftApp
//
//  Created by Piksel on 16.12.2021.
//

import UIKit
import SideMenu

final class MainVC: BaseVC {
    
//    http://www.omdbapi.com/?apikey=[529221a]&
//    http://img.omdbapi.com/?apikey=[529221a]&
    
    private var menu: SideMenuNavigationController?
    private var viewmodel: MainVM = MainVM()

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searcButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupTableView()
        viewmodel.delegate = self
    }
    
    private func initialize () {
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        self.title = "Search Film"
        
        searchBarView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        searchBarView.layer.cornerRadius = 10
        searchBarView.layer.borderWidth = 2
        searchTextField.placeholder = "Search"
        searchTextField.backgroundColor = .clear
        searchTextField.layer.borderWidth = 0
        searchTextField.layer.borderColor = UIColor.clear.cgColor

        searcButton.layer.borderColor = UIColor.clear.cgColor
        viewmodel.dataSource.clickedData = { id in
            Router.showDetailPage(self.navigationController, id: id)
        }
    }
    
    @IBAction func aramaYap(_ sender: Any) {
        SwiftSpinner.show("Filmler Listeleniyor")
        viewmodel.callService(aranan: self.searchTextField.text ?? "")
        viewmodel.dataSource.searchedText = self.searchTextField.text ?? ""
    }
    

    @IBAction func textFieldEditngChanged(_ sender: Any) {
    }
    
    private func setupTableView() {
        tableView.dataSource = viewmodel.dataSource
        tableView.delegate = viewmodel.dataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    @IBAction func didTabMenu(){
        present(menu!, animated: true)
    }


}

extension MainVC: MainVMDelegateOutputs {
    func noDataShowError() {
        let alert = UIAlertController(title: "Hata", message: "Aranan Sonuç Bulunamadı", preferredStyle: .alert)
        let okAction = UIAlertAction (title: "Tamam", style: .cancel, handler: nil)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }
    
    func showIndicator() {
        SwiftSpinner.show("Dowloading")
    }
    
    func dismissIndicator() {
        SwiftSpinner.hide()
    }
    
    func refreshTableView() {
        tableView.reloadData()
    }
    
    
}
extension MainVC: Instantiatable {
    static var storyboard: Storyboard = .main
}
