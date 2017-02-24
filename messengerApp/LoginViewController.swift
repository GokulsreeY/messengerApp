//
//  LoginViewController.swift
//  messengerApp
//
//  Created by Gokulsree Yenugadhati on 2/23/17.
//  Copyright © 2017 Gokul Yenugadhati. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        user.signUpInBackground { (
            success,
            error) in
            if let error = error{
                //self.alert(message: "User already exists!")
                
            }else{
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            }
        }
        
        }
    
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("error occured")
                //self.alert(message: "Incorrect username or password")
            }
        }
        
    }
    
}
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


