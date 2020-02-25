//
//  NYCPublicationPresenter.swift
//  TechECS

import Foundation
import UIKit

class NYCPublicationPresenter  : NYCPublicationPresenterProtocol {
    var router: NYCPublicationRouterProtocol?
    
    var interactor: NYCPublicationInteractorInputProtocol?
    
    var view: NYCPublicationProtocol?
    
    func viewDidLoad() {
        interactor?.loadNYCArticle()
    }
    
    func viewWillAppear(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

extension NYCPublicationPresenter : NYCPublicationInteractorOutputProtocol {
    func didLoadArticleList(list: [DocsNYTIME]) {
        view?.showItems(list: list)
        
    }
    
    func didFailToLoad(with message: String?) {
        view?.showError(message)
    }
    
    func didSucces(with message: String?) {
        view?.success(message)
    }
    

}
