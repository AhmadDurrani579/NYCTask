//
//  NYCInteractor.swift
//  TechECS
//
//  Created by Ahmed Durrani on 25/07/2019.
//  Copyright © 2019 TeachEase solution. All rights reserved.
//

import Foundation
import UIKit

class NYCInteractor : NYCPublicationInteractorInputProtocol {
    var presenter: NYCPublicationInteractorOutputProtocol?

    func loadNYCArticle() {
        let endPoint = AuthEndpoint.NYTime
        let context = (presenter)
        NetworkLayer.fetch(endPoint, with: NYTime.self) { (result) in
            switch result {
            case .success(let response):
                if response.status == "OK" {
//                    context?.didLoadReceipeList(list: response.data!)
                    context?.didLoadArticleList(list: (response.data?.doctLit)!)
                    context?.didSucces(with: response.copyright)

                } else {
                    context?.didFailToLoad(with: response.copyright)
                }
            case .failure(let error): break
            context?.didFailToLoad(with: error.localizedDescription)
            }
            //            context?.didFailToLoad(with: "")
            
            
        }
    }
    
    


}
