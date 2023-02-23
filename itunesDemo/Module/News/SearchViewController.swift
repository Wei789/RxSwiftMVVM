//
//  ViewController.swift
//  RxSwiftMVVM
//
//  Created by 鄭惟臣 on 2023/2/6.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {
    private var viewModel: SearchViewModel!
    private let disposeBag = DisposeBag()
    
    convenience init(viewModel: SearchViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.errors.subscribe(onNext: {[weak self] in self?.handleError(error: $0)}).disposed(by: disposeBag)
    }
}
