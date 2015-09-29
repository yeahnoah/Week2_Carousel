//
//  SignInViewController.swift
//  Week2_Carousel
//
//  Created by Noah Batterson on 9/27/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    let errorAlertController = UIAlertController(title: "Error", message: "Invalid email and/or password", preferredStyle: .Alert)
    
    // create a cancel action
    let tryagainAction = UIAlertAction(title: "Try Again", style: .Cancel) { (action) in
        // handle cancel response here. Doing nothing will dismiss the view.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        self.LoginFormView.frame.origin = CGPoint(x: self.LoginFormView.frame.origin.x, y: self.LoginForminitialY + self.LoginFormoffset)
        
        self.LoginCTAView.frame.origin = CGPoint(x: self.LoginCTAView.frame.origin.x, y: self.LoginCTAinitialY + self.LoginCTAoffset)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        self.LoginFormView.frame.origin = CGPoint(x: self.LoginFormView.frame.origin.x, y: self.LoginForminitialY)
        
        self.LoginCTAView.frame.origin = CGPoint(x: self.LoginCTAView.frame.origin.x, y: self.LoginCTAinitialY)
    }
    
    var LoginForminitialY: CGFloat!
    let LoginFormoffset: CGFloat = -180
    
    var LoginCTAinitialY: CGFloat!
    let LoginCTAoffset: CGFloat = -240
    
    var signInAlert = UIAlertView(title: "Signing In...", message: nil, delegate: nil, cancelButtonTitle: nil)
    var failedSignInAlert = UIAlertView(title: "Unable to Sign In", message: "We didn't recognize the Email Address and/or Password you entered", delegate: nil, cancelButtonTitle: "Try Again")
    var emptyEmailAlert = UIAlertView(title: "Invalid Email Address", message: "Email Address field cannot be empty", delegate: nil, cancelButtonTitle: "Try Again")
    var emptyPasswordAlert = UIAlertView(title: "Invalid Password", message: "Password field cannot be empty", delegate: nil, cancelButtonTitle: "Try Again")
        var emptyEmailAndPasswordAlert = UIAlertView(title: "Invalid Credentials", message: "Email Address and Password fields cannot be empty", delegate: nil, cancelButtonTitle: "Try Again")
    
    @IBAction func SignInBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    @IBAction func SignInButton(sender: AnyObject) {
    
        
        //BEGIN CHECK USERNAME/PASSWORD
        
        if EmailField.text == "noah@noahbatterson.com" && PasswordField.text == "password"{
            
            self.signInAlert.show()
            
            delay(2, closure: { () -> () in
                self.signInAlert.dismissWithClickedButtonIndex(-1, animated: true)
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            })
        }
        else if EmailField.text == "" {
            emptyEmailAlert.show()
        }
        else if PasswordField.text == "" {
            emptyPasswordAlert.show()
        }
//        else if EmailField.text == "" && PasswordField.text == "" {
//            emptyEmailAndPasswordAlert.show()
//        }
                else {
            signInAlert.show()
            
            delay(1, closure: { () -> () in
                self.signInAlert.dismissWithClickedButtonIndex(-1, animated: true)
                
                self.failedSignInAlert.show()
            })
        }
        //END CHECK USERNAME/PASSWORD

    }
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var LoginFormView: UIView!
    @IBOutlet weak var LoginCTAView: UIView!
    @IBAction func LogInTapGesture(sender: AnyObject) {
        EmailField.endEditing(true)
        PasswordField.endEditing(true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        LoginForminitialY = LoginFormView.frame.origin.y
        LoginCTAinitialY = LoginCTAView.frame.origin.y
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
