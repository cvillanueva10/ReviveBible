//
//  SettingsViewController.swift
//  ReviveBible
//
//  Created by Christopher Villanueva on 3/10/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    private lazy var homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Home", for: .normal)
        button.addTarget(self, action: #selector(handleHomePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func handleHomePressed() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        layoutViews()
    }

    func layoutViews() {
        view.addSubview(homeButton)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            homeButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10)
            ])
    }

}

