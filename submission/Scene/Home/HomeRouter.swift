//
//  HomeRouter.swift
//  submission
//
//  Created by Ade Resie on 11/09/22.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    static func createModule(type: List) -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.type = type
        interactor.presenter = presenter
        interactor.repository = Injection.getInstance()
        
        return view
    }
    
    func toDetailScreen(nav: UINavigationController, id: Float) {
        let view = DetailRouter.createModule(id: id)
        nav.pushViewController(view, animated: true)
    }
    
}
