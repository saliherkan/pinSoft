//
//  MainVM.swift
//  PinSoftApp
//
//  Created by Piksel on 18.12.2021.
//

import Foundation
// MARK: Delegate
protocol MainVMDelegate {
    var delegate: MainVMDelegateOutputs? { get set }
    var dataSource: MainDataSource { get set }
}

// MARK: Delegate Outputs
protocol MainVMDelegateOutputs: AnyObject {
    func refreshTableView()
    func dismissIndicator()
    func showIndicator()
    func noDataShowError()
}

class MainVM: MainVMDelegate {
    // MARK: Delegate
    var delegate: MainVMDelegateOutputs?
    
    private let service: Service = Service()
    private var serviceLoading: Bool = false
    private var data: [Search] = []
    private var sayfa = 1
    var dataSource: MainDataSource = MainDataSource()
    
    init() {
        dataSource.sonunaEkle = sonunaEkle(aranan:)

    }
    
    func callService(aranan: String){
        // api key = 529221a
        sayfa = 1
        let x = "https://www.omdbapi.com/?apikey=ff95c87e&page=1&s=" + aranan
        service.SearchRequest(endPoint: x, completion: { gelenParametre in
            if let gelenParametre = gelenParametre{
                self.data = gelenParametre.search
                
            } else {
                self.delegate?.noDataShowError()
                self.data = []
            }
            self.dataSource.data = self.data
            self.serviceLoading = false
            self.delegate?.refreshTableView()
            self.delegate?.dismissIndicator()
        })
        
        
    }
    
    func sonunaEkle(aranan: String) {
        if serviceLoading {
            return
        }
        delegate?.showIndicator()
        serviceLoading = true
        sayfa += 1
        let x = "https://www.omdbapi.com/?apikey=ff95c87e&page=" + String(sayfa) + "&s=" + aranan
        service.SearchRequest(endPoint: x, completion: { gelenparamatre in
            if let gelenparametre = gelenparamatre {
                self.data.append(contentsOf: gelenparametre.search)
                self.serviceLoading = false
                self.dataSource.data = self.data
                self.delegate?.refreshTableView()

            } else {
                self.serviceLoading = true

            }
            self.delegate?.dismissIndicator()

        })
    }
}
