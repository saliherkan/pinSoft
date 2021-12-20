//
//  DetailVM.swift
//  PinSoftApp
//
//  Created by Piksel on 19.12.2021.
//

import Foundation

protocol DetailVMDelegate {
    var delegate: DetailVMDelegateOutputs? { get set }
    
}
protocol DetailVMDelegateOutputs: AnyObject {
    func setData(detailResponse: DetailResponse)
}


final class DetailVM: DetailVMDelegate {
    var delegate: DetailVMDelegateOutputs?
    
    let id: String
    let service: Service = Service()
    
    
    
    init(id: String) {
        self.id = id
        DetailRequest()
    }
    
    func DetailRequest(){
        // api key = 529221a
        let x = "https://www.omdbapi.com/?apikey=ff95c87e&i=" + id
        service.DetailRequest(detailId: x, completion: { gelenParametre in
            if let gelenParametre = gelenParametre{
                self.delegate?.setData(detailResponse: gelenParametre)
                
            } else {
    
            }
            
        })
        
        
    }
}
