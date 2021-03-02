//
//  DetailViewModel.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import Foundation
import RxSwift
import UalaNetwork

struct DetailViewModelDataSource: ViewModelDataSourceProtocol {
    let context: Context
    let id: String
}

final class DetailViewModel: ViewModelProtocol {
    
    private let dataSource: DetailViewModelDataSource
    private let router: DetailRouter
    private let providerNetwork = UalaNetwork()
    let title: PublishSubject<String> = PublishSubject()
    let ingredients: PublishSubject<String> = PublishSubject()


    init(dataSource: DetailViewModelDataSource, router: DetailRouter) {
        self.dataSource = dataSource
        self.router = router
        providerNetwork.getMealDetail(by: dataSource.id).subscribe { [weak self] (response) in
            guard let self = self, let meal = response.meals.first else { return }
            self.title.onNext(meal.strMeal)
            let ingredients = """
            \(meal.strIngredient1)
            \(meal.strIngredient2)
            \(meal.strIngredient3)
            \(meal.strIngredient4)
            \(meal.strIngredient5)
            \(meal.strIngredient6)
            \(meal.strIngredient7)
            \(meal.strIngredient8)
            \(meal.strIngredient9)
            \(meal.strIngredient10)
            \(meal.strIngredient11)
            \(meal.strIngredient12)
            \(meal.strIngredient13)
            \(meal.strIngredient14)
            \(meal.strIngredient15)
            \(meal.strIngredient16)
            \(meal.strIngredient17)
            \(meal.strIngredient18)
            \(meal.strIngredient19)
            \(meal.strIngredient20)
            """
            self.ingredients.onNext(ingredients)
        } onError: { (error) in
            debugPrint(error)
        }.dispose()

    }
}
