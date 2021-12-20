//
//  ViewController.swift
//  PinSoftApp
//
//  Created by Piksel on 16.12.2021.
//

import UIKit
import Network


final class ViewController: BaseVC {
    @IBOutlet private weak var messageLabel: UILabel!
    
    private let monitor = NWPathMonitor()
    
    fileprivate func checkNetwork() {
        DispatchQueue.main.async {
            
            self.monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    self.SetLabelText(text: "Pinsoft We're connected! Redirecting")
              
                    print("We're connected! Redirecting")
                    self.sonrakiEkranaGec3SnBekle()
                } else {
                    self.SetLabelText(text: "Pinsoft No connection.")
                    print("No connection.")
                }
                
                print(path.isExpensive)
            }
            let queue = DispatchQueue(label: "Monitor")
            self.monitor.start(queue: queue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    private func SetLabelText(text: String) {
        DispatchQueue.main.async {
            self.messageLabel.text = text
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkNetwork()
    }
    
    private func sonrakiEkranaGec3SnBekle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            Router.pushView(self.navigationController)
        })
    }
    
    @IBAction func goToMainVC(_ sender: Any) {
        Router.pushView(self.navigationController)
    }
}
extension ViewController: Instantiatable {
    static var storyboard: Storyboard = .main
}


