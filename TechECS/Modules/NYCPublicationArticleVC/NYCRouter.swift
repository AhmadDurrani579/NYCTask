//
//  NYCRouter.swift
//  TechECS
//
//

import Foundation
import UIKit

class NYCRouter : NYCPublicationRouterProtocol {
    weak var viewController: UIViewController?

    static func asssembleModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "NYCViewController") as! NYCViewController
        let interactor = NYCInteractor()
        let presenter = NYCPublicationPresenter()
        let router = NYCRouter()
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    

    
   
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }

}
