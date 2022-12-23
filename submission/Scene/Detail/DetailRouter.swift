//
//  DetailRouter.swift
//  submission
//
//  Created by Ade Resie on 18/09/22.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
    static func createModule(id: Float) -> UIViewController {
        let view = DetailViewController()
        view.id = id
        let presenter = DetailPresenter()
        let router = DetailRouter()
        let interactor = DetailInteractor()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.repository = Injection.getInstance()
        return view
    }
}
