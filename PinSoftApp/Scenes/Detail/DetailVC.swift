//
//  DetailVC.swift
//  PinSoftApp
//
//  Created by Piksel on 19.12.2021.
//

import UIKit

final class DetailVC: BaseVC, DetailVMDelegateOutputs {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    
    var viewModel: DetailVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        
        
    }
    
    
    func setData(detailResponse: DetailResponse) {
        print(detailResponse)
        
        imageView.load(url: URL(string: detailResponse.poster)!)
        titleLabel.text = "Title: " + detailResponse.title
        yearLabel.text = "Year: " + detailResponse.year
        releasedLabel.text = "Released: " + detailResponse.released
        directorLabel.text = "Director: " + detailResponse.director
        languageLabel.text = "Language: " + detailResponse.language
//        titleLabel.backgroundColor = UIColor.red
        titleLabel.layer.cornerRadius = 10
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = UIColor.red.cgColor
        
        yearLabel.layer.cornerRadius = 10
        yearLabel.layer.borderWidth = 1
        yearLabel.layer.borderColor = UIColor.green.cgColor
        
        releasedLabel.layer.cornerRadius = 10
        releasedLabel.layer.borderWidth = 1
        releasedLabel.layer.borderColor = UIColor.blue.cgColor
        
        directorLabel.layer.cornerRadius = 10
        directorLabel.layer.borderWidth = 1
        directorLabel.layer.borderColor = UIColor.cyan.cgColor
        
        languageLabel.layer.cornerRadius = 10
        languageLabel.layer.borderWidth = 1
        languageLabel.layer.borderColor = UIColor.darkGray.cgColor
    }
    

}

extension DetailVC: Instantiatable {
    static var storyboard: Storyboard = .main
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
