//
//  DetailViewController.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class DetailViewController: UIViewController, ViewControllerProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var viewModel: DetailViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.title.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.ingredients.bind(to: ingredientsTextView.rx.text).disposed(by: disposeBag)
        
    }
    
    func configure(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
}
