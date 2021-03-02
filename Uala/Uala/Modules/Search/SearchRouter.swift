//
//  SearchRouter.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import Foundation
import UIKit

final class SearchRouter: RouterProtocol {
    internal weak var viewController: UIViewController?

    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func pushToDetail(with id: String) {
        let context = Context()
        let dataSource = DetailViewModelDataSource(context: context, id: id)
        push(viewController: DetailBuilder.build(with: dataSource))
    }
}
