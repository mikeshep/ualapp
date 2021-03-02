//
//  RouterProtocol.swift
//  Uala
//
//  Created by Miguel Angel Olmedo Perez on 02/03/21.
//

import Foundation
import UIKit

protocol RouterProtocol {
    var viewController: UIViewController? { get }
    init(viewController: UIViewController)
    func routeBack()
}

extension RouterProtocol {
    
    func routeBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
