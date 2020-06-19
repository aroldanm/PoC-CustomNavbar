//
//  NavigationController.swift
//  NavAnimation Demo
//
//  Created by Alan Roldán Maillo on 18/06/2020.
//  Copyright © 2020 Alan Roldán Maillo. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    private var containerController: ContainerViewController

    override init(rootViewController: UIViewController) {
        containerController = ContainerViewController(rootViewController: rootViewController)
        super.init(rootViewController: containerController)
        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        navigationBar.isTranslucent = true
        navigationBar.barTintColor = .systemIndigo
        navigationBar.tintColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
