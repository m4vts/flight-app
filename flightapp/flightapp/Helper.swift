//
//  ViewExtension.swift
//  flightapp
//
//  Created by Onur Mavitas on 10.06.2021.
//
import UIKit

extension UIView {

    func addBackground(imageName: String, x: CGFloat, y: CGFloat, width: CGFloat = UIScreen.main.bounds.size.width, height: CGFloat) {

        let background = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        background.image = UIImage(named: imageName)
        
        background.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.addSubview(background)
        self.sendSubviewToBack(background)
    }    
}

extension UIViewController {

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}

