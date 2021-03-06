//
//  HomeContainerView.swift
//  ReviveBible
//
//  Created by Christopher Villanueva on 3/3/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

protocol HomeContainerViewDelegate: class {
    func handleSettingsButtonPressed()
}

class HomeContainerView: UIView {

    var verseToDisplay: String = "" {
        didSet {
            self.verseTextView.text = verseToDisplay
        }
    }
    private var verseTextView: VerseTextView
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.addTarget(self, action: #selector(handleSettingsPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // TODO: Rename and Repurpose
    private lazy var responseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Response", for: .normal)
        button.addTarget(self, action: #selector(handleResponsePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    weak var delegate: HomeContainerViewDelegate?

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        self.verseTextView = VerseTextView()
        verseTextView.centerVertically()
        mainStackView.addArrangedSubview(verseTextView)
        super.init(frame: .zero)
        mainStackView.addArrangedSubview(responseButton)
        self.backgroundColor = .blue
        self.translatesAutoresizingMaskIntoConstraints = false
        layoutViews()
    }

    func layoutViews() {
        addSubview(settingsButton)
        addSubview(mainStackView)
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32),
            mainStackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            ])
    }
    
    // TODO: Rename and Repurpose
    @objc func handleResponsePressed() {
        // TODO: Implement functionality
        print(123)
    }

    @objc func handleSettingsPressed() {
        delegate?.handleSettingsButtonPressed()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
