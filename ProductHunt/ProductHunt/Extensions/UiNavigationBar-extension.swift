//
//  UiImage-extension.swift
//  ProductHunt
//
//  Created by Gleb Sigal on 20.08.17.
//  Copyright © 2017 Gleb Sigal. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    func setBottomBorderColor(color: UIColor, height: CGFloat) {
        let bottomBorderRect = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        let bottomBorderView = UIView(frame: bottomBorderRect)
        bottomBorderView.backgroundColor = color
        addSubview(bottomBorderView)
    }
}
