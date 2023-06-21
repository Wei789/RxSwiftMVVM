//
//  ViewController.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/6.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {
    //    private var viewModel: SearchViewModel!
    private let disposeBag = DisposeBag()

    private let searchBar = UISearchBar()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        indicator.color = .white
        return indicator
    }()

    @Inject var viewModel: SearchViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        searchBar.placeholder = "Search Music"

        view.addSubview(activityIndicator)
    }

    private func bindViewModel() {
        searchBar.rx.text
            .orEmpty
            .bind(to: viewModel.input.searchKeyword)
            .disposed(by: disposeBag)
        
        viewModel.output.music
            .drive(onNext: { result in
                print("API CALL")
                print(result.count)
            })
            .disposed(by: disposeBag)

        viewModel.output.loading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)

        viewModel.errorRouter.error
            .subscribe(onNext: {[weak self] in
                self?.handleError(error: $0)
            })
            .disposed(by: disposeBag)
    }
}
