//
//  UILabel+Extensions.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 14.01.2025.
//

import UIKit

extension UILabel {
    static func getLabel(_ text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.toAutoLayout()
        label.font = font
        label.textColor = R.color.light()
        label.textAlignment = .left
        label.text = text
        return label
    }
    
    static func getLabel(_ text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.toAutoLayout()
        label.font = font
        label.textColor = textColor
        label.textAlignment = .left
        label.text = text
        return label
    }
    
    static func getTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.toAutoLayout()
        label.font = R.font.inter28ptRegular(size: 24)
        label.textColor = R.color.primaryText()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.text = text
        return label
    }
}
