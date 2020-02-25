//
//  NYCInteractor.swift
//  TechECS
//
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
                    context?.didLoadArticleList(list: (response.data?.doctLit)!)
                    context?.didSucces(with: response.copyright)

                } else {
                    context?.didFailToLoad(with: response.copyright)
                }
            case .failure(let error): break
            context?.didFailToLoad(with: error.localizedDescription)
            }
        }
    }
    
    


}
