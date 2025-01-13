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
}
