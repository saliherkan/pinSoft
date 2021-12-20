//
//  MainDataSource.swift
//  PinSoftApp
//
//  Created by Piksel on 19.12.2021.
//

import UIKit


class MainDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var data: [Search] = []
    var searchedText: String = ""
    var clickedData: ((String) -> ())?
    
    var sonunaEkle: ((String) -> ())?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = data.count
        
        return count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.red
        cell.textLabel?.text = data[indexPath.row].title
        let value: Double = Double(indexPath.row) / Double(data.count)
        if value >= 0.9 {
            sonunaEkle?(searchedText)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedData?(data[indexPath.row].imdbID)
    }
    

}
