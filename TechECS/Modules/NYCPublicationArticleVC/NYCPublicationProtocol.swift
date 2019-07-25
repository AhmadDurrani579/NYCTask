//
//  NYCPublicationProtocol.swift
//  TechECS
//
//  Created by Ahmed Durrani on 25/07/2019.
//  Copyright © 2019 TeachEase solution. All rights reserved.
//

import Foundation
import UIKit

protocol NYCPublicationProtocol : class {
    var presenter: NYCPublicationPresenterProtocol? { get set }
    // PRESENTER -> INTERACTOR
    
    func showItems(list : [DocsNYTIME])
    func showError(_ message: String?)
    func success(_ message: String?)
}

protocol NYCPublicationInteractorInputProtocol: class {
    var presenter: NYCPublicationInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func loadNYCArticle()
    
    
}

protocol NYCPublicationInteractorOutputProtocol {
    func didLoadArticleList(list : [DocsNYTIME])
    func didFailToLoad(with message: String?)
    func didSucces(with message: String?)
    
}

protocol NYCPublicationPresenterProtocol : class {
    var router : NYCPublicationRouterProtocol? {get set}
//    var router: GUReceipeRouterProtocol? { get set }
    var interactor: NYCPublicationInteractorInputProtocol? { get set }
    var view: NYCPublicationProtocol? { get set }
    // VIEW -> PRESENTER
    func viewDidLoad()
    func viewWillAppear(navigationController:UINavigationController)
    
}

protocol NYCPublicationRouterProtocol {
    var viewController : UIViewController? {get set}
    static func asssembleModule() -> UIViewController
    //    func pushMainVC(navigationConroller:UINavigationController)
}
