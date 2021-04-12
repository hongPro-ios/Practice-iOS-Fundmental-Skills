//
//  Presenter.swift
//  VIPER
//
//  Created by JEONGSEOB HONG on 2021/04/12.
//

import Foundation


// Object
// protocol
// ref to interactor, router, view

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    
    var view: AnyView?
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let user):
            view?.update(with: user)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
    
}
