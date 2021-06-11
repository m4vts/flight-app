//
//  SplashViewController.swift
//  flightapp
//
//  Created by Onur Mavitas on 10.06.2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redirectPage()
    }
    
    private func redirectPage() {
        DispatchQueue.main.async {
            if self.checkLoginStatus() {
                self.goToMain()
            } else {
                self.goToLogin()
            }
        }
    }
    
    private func checkLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "rememberMe")
    }
    
    private func goToLogin() {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") {
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: destinationVC)
        }
    }
    
    private func goToMain() {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") {
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: destinationVC)
        }
    }
    
    
}
