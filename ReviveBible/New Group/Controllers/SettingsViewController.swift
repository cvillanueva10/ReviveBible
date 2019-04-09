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
        return button
    }()

    private lazy var startTimePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private lazy var endTimePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private let pickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()

    @objc func handleHomePressed() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        for component in [homeButton, pickerStackView] {
            component.backgroundColor = .white
            component.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(component)
        }
        for stackComponent in [startTimePickerView, endTimePickerView] {
            stackComponent.backgroundColor = .white
            pickerStackView.addArrangedSubview(stackComponent)
        }
        layoutViews()
    }

    func layoutViews() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            homeButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            pickerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pickerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerStackView.widthAnchor.constraint(equalToConstant: 300),
            pickerStackView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 12
        case 1:
            return 60
        case 2:
            return 2
        default:
            fatalError("Should not get here")
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 2 {
            return row == 0 ? "AM" : "PM"
        } else {
            let timeNumber = component == 0 ? row + 1 : row
            return String(format: "%02d", timeNumber)
        }
    }
}


