//
//  UIUtility.swift
//  BarclaysAssignment
//
//  Created by Bhavana R. Kamble on 06/12/22.
//

import Foundation
import UIKit

extension UIView {
    
    func applyCornerRadius(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}

extension UILabel {
    func makeRoundedLabel() {
        //        roundedLabelLogo.backgroundColor = .orange
        //        roundedLabelLogo.textColor = .white
        //        roundedLabelLogo.layer.cornerRadius = roundedLabelLogo.bounds.width / 2
        //        roundedLabelLogo.layer.masksToBounds = true
        //        roundedLabelLogo.textAlignment = .center

        self.textColor = .white
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
        self.textAlignment = .center
    }
}
