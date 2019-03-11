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
    weak var delegate: HomeContainerViewDelegate?

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        self.verseTextView = VerseTextView()
        verseTextView.centerVertically()
        self.mainStackView.addArrangedSubview(verseTextView)
        super.init(frame: .zero)
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
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            ])
    }

    @objc func handleSettingsPressed() {
        delegate?.handleSettingsButtonPressed()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
