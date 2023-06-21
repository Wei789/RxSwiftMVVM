//
//  DIContainer.swift
//  itunesDemo
//
//  Created by user on 2023/6/21.
//

import Swinject

class DIContainer {
    static let shared = DIContainer()

    private let container = Container()

    private init() {
        InjectSettings.resolver = container
    }

    func register() {
        registerNetwork()
        registerRepo()
        registerUseCase()
        registerViewModel()
    }

    func registerNetwork() {
        container.register(Networkable.self) { _ in
            Network()
        }
    }

    func registerRepo() {
        container.register(SearchMusicRepository.self) {
            let api = $0.resolve(Networkable.self)!
            return SearchMusicRepositoryImpl(api: api)
        }
    }

    func registerUseCase() {
        container.register(SearchMusicUseCase.self) {
            let repo = $0.resolve(SearchMusicRepository.self)!
            return SearchMusicUseCaseImpl(repo: repo)
        }
    }

    func registerViewModel() {
        container.register(SearchViewModel.self) {
            let useCase = $0.resolve(SearchMusicUseCase.self)!
            return SearchViewModel(useCase: useCase)
        }
    }
}
