//
//  DetailViewController.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import Foundation
import UIKit
import RxCocoa

class DetailViewController: UIViewController, ViewControllerProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.title.bind(to: titleLabel.rx.text)
        viewModel.ingredients.bind(to: ingredientsTextView.rx.text)
        
    }
    
    func configure(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
}
