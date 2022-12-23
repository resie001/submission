//
//  Injection.swift
//  submission
//
//  Created by Ade Resie on 08/12/22.
//

import Foundation

final class Injection {
    static private let shared = Injection()
    static private var instance: GameRepositoryProtocol?
    
    static func getInstance() -> GameRepositoryProtocol {
        if instance == nil {
            instance = shared.provideRepository()
        }
        return instance!
    }
    
    private func provideRepository() -> GameRepositoryProtocol {
        let locale = LocalDataSource.shared
        let remote = RemoteDataSource.shared
        return GameRepository.sharedInstance(locale, remote)
    }
}
