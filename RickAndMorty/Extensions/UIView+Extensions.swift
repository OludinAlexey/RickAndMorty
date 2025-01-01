//
//  UIView+Extensions.swift
//  Memorizer
//
//  Created by Алексей Олудин on 11.12.2024.
//

import UIKit

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pin(to superView: UIView, with insets: NSDirectionalEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: insets.bottom),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: insets.leading),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: insets.trailing)
        ])
    }
    
    func pin(to layoutGuide: UILayoutGuide, with insets: NSDirectionalEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: insets.bottom),
            leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.leading),
            trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: insets.trailing)
        ])
    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
}
