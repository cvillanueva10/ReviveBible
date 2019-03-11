//
//  VerseTextView.swift
//  ReviveBible
//
//  Created by Christopher Villanueva on 3/3/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

class VerseTextView: UITextView {

    init() {
        super.init(frame: .zero, textContainer: nil)
        configureTextViewLayout()
    }

    func configureTextViewLayout() {
        textAlignment = .center
        backgroundColor = .red
        isScrollEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UITextView {
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}
