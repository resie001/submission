//
//  DetailPresenter.swift
//  submission
//
//  Created by Ade Resie on 17/09/22.
//

import Foundation

class DetailPresenter: DetailViewToPresenterProtocol {
    var router: DetailPresenterToRouterProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var view: DetailPresenterToViewProtocol?
    var games: GameDetailModel!
    
    func fetchDetail(id: Float) {
        interactor?.fetchGameDetail(id: id)
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    func gameResult(games: GameResponse?, isSuccess: Bool, message: String?) {
        if isSuccess {
            self.games = GameMapper.mapGameResponseToDetailModel(input: games!)
            view?.showDetail()
        } else {
            view?.showError(error: message!)
        }
    }
}
