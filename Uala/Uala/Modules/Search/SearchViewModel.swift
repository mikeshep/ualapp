//
//  SearchViewModel.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import RxSwift
import RxCocoa
import UalaNetwork

struct SearchViewModelDataSource: ViewModelDataSourceProtocol {
    var context: Context
}

final class SearchViewModel: ViewModelProtocol {
    let items: PublishSubject<[String]> = PublishSubject()
    let searchString: PublishSubject<String> = PublishSubject()
    private let dataSource: SearchViewModelDataSource
    private let router: SearchRouter
    private let providerNetwork = UalaNetwork()
    let disposeBag = DisposeBag()
    
    init(dataSource: SearchViewModelDataSource, router: SearchRouter) {
        self.dataSource = dataSource
        self.router = router
        searchString.subscribe { [weak self] (event) in
            guard let self = self, let string = event.element else { return }
            self.providerNetwork.search(by: string).subscribe { (response) in
                debugPrint("response \(response)")
                self.items.onNext(response.meals.map({ $0.strMeal } ))
            } onError: { (error) in
                debugPrint("error \(error)")
            }.disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
    }
    
    
}
