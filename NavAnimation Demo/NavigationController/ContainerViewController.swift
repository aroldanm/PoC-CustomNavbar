//
//  ContainerViewController.swift
//  NavAnimation Demo
//
//  Created by Alan Roldán Maillo on 18/06/2020.
//  Copyright © 2020 Alan Roldán Maillo. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    private let rootViewController: UIViewController?
    @IBOutlet weak private var stackView: UIStackView!
    @IBOutlet weak private var constraintHeightBar: NSLayoutConstraint! {
        didSet {
            if let navigation = navigationController?.navigationBar {
                constraintHeightBar.constant = navigation.frame.size.height
            }
        }
    }
    @IBOutlet weak private var titleLabel: UILabel! {
        didSet {
            if let navigation = navigationController?.navigationBar {
                titleLabel.textColor = navigation.tintColor
            }
        }
    }
    @IBOutlet weak private var navigationView: UIView! {
        didSet {
            navigationView.clipsToBounds = true
            navigationView.layer.cornerRadius = 25
            navigationView.layer.maskedCorners = [.layerMinXMaxYCorner]
        }
    }

    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
        super.init(nibName: "ContainerViewController", bundle: Bundle(for: ContainerViewController.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension ContainerViewController {
    func setup() {
        if let rootViewController = rootViewController {
            stackView.addArrangedSubview(rootViewController.view)
            addChild(rootViewController)

            titleLabel.text = rootViewController.title

            navigationItem.leftBarButtonItem = rootViewController.navigationItem.leftBarButtonItem
            navigationItem.rightBarButtonItem = rootViewController.navigationItem.rightBarButtonItem
        }
    }
}
