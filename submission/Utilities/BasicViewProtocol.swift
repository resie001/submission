//
//  BasicViewProtocol.swift
//  submission
//
//  Created by Ade Resie on 11/09/22.
//

import Foundation
import UIKit

protocol BasicViewProtocol: AnyObject {
    var nav: UINavigationController? {get}
    func alert(title: String, message: String)
    func alert(title: String, message: String, completion: (() -> Void)?)
}
