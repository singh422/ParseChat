//
//  AppDelegate.swift
//  ChatClient
//
//  Created by Avinash Singh on 02/12/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//
import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var logoView: UIImageView!
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
    
    func signUp() {
        let user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackground { (succeeded: Bool, error: Error?) in
            
            if let error = error {
                let errorString = error.localizedDescription as? NSString
                print(errorString!);
                if self.emailTextField.text == ""{
                
                    let alertController = UIAlertController(title: "Email required", message: errorString as String!, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
                else if self.passwordTextField.text == "" {
                
                    let alertController = UIAlertController(title: "Password required", message: errorString as String!, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                }
                
                else
                {
                    let alertController = UIAlertController(title: "Error", message: errorString as String!, preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
 
                    
                }
                
                // Show the errorString somewhere and let the user try again.
            } else {
                
                
                
                // Hooray! Let them use the app now
                //no error action
                
                let alertController = UIAlertController(title: "Success", message:  "Sign Up Successful", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }

            }
            
        }
        
    }
    
        func login() {
            PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (response: PFUser?, error: Error?) in
                //code after login
                if error == nil {
                    //no error action
                    
                    let alertController = UIAlertController(title: "Success", message:  "Login Successful", preferredStyle: .alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
                else {
                    //error action
                    
                    let errorString = error!.localizedDescription as NSString
                    print(errorString);
                    if self.emailTextField.text == ""{
                
                        let alertController = UIAlertController(title: "Email required", message: errorString as String!, preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            // handle response here.
                        }
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                        
                        self.present(alertController, animated: true) {
                            // optional code for what happens after the alert controller has finished presenting
                        }
                    }
                    else if self.passwordTextField.text == "" {
                        
                        let alertController = UIAlertController(title: "Password required", message: errorString as String!, preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            // handle response here.
                        }
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                        
                        self.present(alertController, animated: true) {
                            // optional code for what happens after the alert controller has finished presenting
                        }
                }
                else
                    {
                        let alertController = UIAlertController(title: "Error", message: errorString as String!, preferredStyle: .alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            // handle response here.
                        }
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                        
                        self.present(alertController, animated: true) {
                            // optional code for what happens after the alert controller has finished presenting
                        }
  
                    }
            }}
        
    }//login

    @IBAction func signUpAction(_ sender: Any) {
        self.signUp()
    }

    @IBAction func loginAction(_ sender: Any) {
        self.login()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



