//
//  HomeRouter.swift
//  ExperimentProject
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 07/12/20.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    
    static func createModule(param: HomeParam) -> HomeViewController {
        let layout = UICollectionViewFlowLayout()
        let view = HomeViewController()
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        view.view.backgroundColor = .white
        view.param = param
        view.title = ""
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
