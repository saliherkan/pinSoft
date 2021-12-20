//
//  MenuListController.swift
//  PinSoftApp
//
//  Created by Piksel on 19.12.2021.
//

import UIKit


class MenuListController: UITableViewController {
    private let items = ["Salih Erkan SANDAL", "saliherkansandal@gmail.com", "+905057603144", "iOS Developer", "This for PinSoft"]
    private let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension MenuListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.backgroundColor = darkColor
        return cell
    }
}
