//
//  AboutRouter.swift
//  submission
//
//  Created by Ade Resie on 11/09/22.
//

import UIKit

class AboutRouter: AboutRouterProtocol {
    static func createModule() -> UIViewController {
        let view = AboutViewController()
        return view
    }
}
