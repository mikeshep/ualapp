//
//  SearchViewController.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import UalaNetwork

class SearchViewController : UIViewController, ViewControllerProtocol, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var disposeBag = DisposeBag()
    
    private var viewModel: SearchViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.strMeal)"
                cell.detailTextLabel?.text = "\(element.strCategory)"
            }
            .disposed(by: disposeBag)

        tableView
            .rx
            .modelSelected(Meal.self)
            .bind(to: viewModel.mealDetail)
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty.changed.asObservable().subscribe { [weak self] (event) in
            guard let self = self, let element = event.element else { return }
            self.viewModel.searchString.onNext(element)
        }.disposed(by: disposeBag)
    }
    
    func configure(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }

}

