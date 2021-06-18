//
//  MoviesSceneDIContainer.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 03.03.19.
//

import UIKit
import SwiftUI

final class MoviesSceneDIContainer {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
        let imageDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    // MARK: - Persistent Storage  생각: 이것도 realm으로 바꿀 수 있도록 DataTransferService 방식으로 바꾸고 외부로 빼는게 좋을것 같다.
    lazy var moviesQueriesStorage: MoviesQueriesStorage = CoreDataMoviesQueriesStorage(maxStorageLimit: 10)
    lazy var moviesResponseCache: MoviesResponseStorage = CoreDataMoviesResponseStorage()
    
    // MARK: - init
    init(dependencies: Dependencies) {
        self.dependencies = dependencies        
    }
    
    // MARK: - UseCases
    func makeSearchMoviesUseCase() -> SearchMoviesUseCase {
        return DefaultSearchMoviesUseCase(
            moviesRepository: makeMoviesRepository(),
            moviesQueriesRepository: makeMoviesQueriesRepository())
    }
    
    func makeFetchRecentMovieQueriesUseCase(
        requestValue: FetchRecentMovieQueriesUseCase.RequestValue,
        completion: @escaping (FetchRecentMovieQueriesUseCase.ResultValue) -> Void
    ) -> UseCase {
        return FetchRecentMovieQueriesUseCase(
            requestValue: requestValue,
            completion: completion,
            moviesQueriesRepository: makeMoviesQueriesRepository()
        )
    }
    
    // MARK: - Data > Repositories
    func makeMoviesRepository() -> MoviesRepository {
        return DefaultMoviesRepository(
            dataTransferService: dependencies.apiDataTransferService,
            cache: moviesResponseCache)
    }
    
    func makeMoviesQueriesRepository() -> MoviesQueriesRepository {
        return DefaultMoviesQueriesRepository(
            dataTransferService: dependencies.apiDataTransferService,
            moviesQueriesPersistentStorage: moviesQueriesStorage)
    }
    
    func makePosterImagesRepository() -> PosterImagesRepository {
        return DefaultPosterImagesRepository(dataTransferService: dependencies.imageDataTransferService)
    }
}

extension MoviesSceneDIContainer: MoviesSearchFlowCoordinatorDependencies {
    // MARK: - Present > Movies List
    func makeMoviesListViewController(actions: MoviesListViewModelActions) -> MoviesListViewController {
        return MoviesListViewController.create(
            with: makeMoviesListViewModel(actions: actions),
            posterImagesRepository: makePosterImagesRepository())
    }
    
    func makeMoviesListViewModel(actions: MoviesListViewModelActions) -> MoviesListViewModel {
        return DefaultMoviesListViewModel(
            searchMoviesUseCase: makeSearchMoviesUseCase(),
            actions: actions)
    }
    
    // MARK: - Present > Movie Details
    func makeMoviesDetailsViewController(movie: Movie) -> UIViewController {
        return MovieDetailsViewController.create(with: makeMoviesDetailsViewModel(movie: movie))
    }
    
    func makeMoviesDetailsViewModel(movie: Movie) -> MovieDetailsViewModel {
        return DefaultMovieDetailsViewModel(
            movie: movie,
            posterImagesRepository: makePosterImagesRepository())
    }
    
    // MARK: - Present > Movies Queries Suggestions List
    func makeMoviesQueriesSuggestionsListViewController(didSelect: @escaping MoviesQueryListViewModelDidSelectAction) -> UIViewController {
        return MoviesQueriesTableViewController.create(with: makeMoviesQueryListViewModel(didSelect: didSelect))
    }
    
    func makeMoviesQueryListViewModel(didSelect: @escaping MoviesQueryListViewModelDidSelectAction) -> MoviesQueryListViewModel {
        return DefaultMoviesQueryListViewModel(
            numberOfQueriesToShow: 10,
            fetchRecentMovieQueriesUseCaseFactory: makeFetchRecentMovieQueriesUseCase,
            didSelect: didSelect)
    }
    
    // MARK: - Flow Coordinators
    func makeMoviesSearchFlowCoordinator(navigationController: UINavigationController) -> MoviesSearchFlowCoordinator {
        return MoviesSearchFlowCoordinator(
            navigationController: navigationController,
            dependencies: self)
    }
    
}
