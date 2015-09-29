//
//  createAccountViewController.swift
//  Week2_Carousel
//
//  Created by Noah Batterson on 9/28/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class createAccountViewController: UIViewController {
    @IBAction func termsButton(sender: AnyObject) {
    }
    @IBAction func checkBoxButton(sender: UIButton) {
        sender.selected = true
    }
    @IBOutlet weak var createCTAView: UIView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var createFormView: UIView!
    @IBAction func didTapView(sender: AnyObject) {
        emailField.endEditing(true)
        passwordField.endEditing(true)
    }
    
    @IBAction func createAccountBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        self.createFormView.frame.origin = CGPoint(x: self.createFormView.frame.origin.x, y: self.createForminitialY + self.createFormoffset)
        
        self.createCTAView.frame.origin = CGPoint(x: self.createCTAView.frame.origin.x, y: self.createCTAViewinitialY + self.createCTAViewoffset)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        self.createFormView.frame.origin = CGPoint(x: self.createFormView.frame.origin.x, y: self.createForminitialY)
        
        self.createCTAView.frame.origin = CGPoint(x: self.createCTAView.frame.origin.x, y: self.createCTAViewinitialY)
    }
    
    var createForminitialY: CGFloat!
    let createFormoffset: CGFloat = -125
    
    var createCTAViewinitialY: CGFloat!
    let createCTAViewoffset: CGFloat = -215

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        createForminitialY = createFormView.frame.origin.y
        createCTAViewinitialY = createCTAView.frame.origin.y
        

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
