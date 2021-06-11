//
//  LoginViewController.swift
//  flightapp
//
//  Created by Onur Mavitas on 10.06.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var switchRememberMe: UISwitch!

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(imageName: "PlaneStraight",x: 0, y: CGFloat(70), height: CGFloat(259.0))
        self.view.addBackground(imageName: "bg", x: 0, y: 0, height: CGFloat(280.0))
        
        tfEmail.delegate = self
        tfPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfPassword.endEditing(true)
        tfEmail.endEditing(true)
        return true
    }
    
    //MARK: - Login
    
    @IBAction func actionLogin(_ sender: UIButton) {
        tfPassword.endEditing(true)
        loginUser()
    }
    
    
    private func loginUser() {
        let email = tfEmail.text
        let password = tfPassword.text
        openMainVC()
        
        if email == "appcent@appcent.mobi" && password == "123456" {
            if switchRememberMe.isOn {
                saveUserData()
            }
            openMainVC()
        } else {
            alertUser()
        }
    }
    
    private func alertUser() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Bilgileriniz hatalıdır.", message: "Lütfen bilgilerinizi kontrol ediniz.", preferredStyle: UIAlertController.Style.alert)
            //alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func saveUserData() {
        UserDefaults.standard.set(true, forKey: "rememberMe")
    }

    func openMainVC() {
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") {
            UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: destinationVC)
        }
    }

}
