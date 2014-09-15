//
//  signInViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/15/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func signInButton(sender: AnyObject) {
        var alertView : UIAlertView
        if (emailText.text == "kc@kevnull.com" && passwordText.text == "password") { performSegueWithIdentifier("loginSegue", sender: self)
        }
        else if (emailText.text.isEmpty) {
            alertView = UIAlertView(title: "No Email", message: "Email address is required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else if (passwordText.text.isEmpty) {
            alertView = UIAlertView(title: "No Password", message: "Password is required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else {
            alertView = UIAlertView(title: "Incorrect Login", message: "Couldn't find a valid email/password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        }
    }
    @IBAction func clearKeyButton(sender: AnyObject) {

    }
    @IBAction func keyboardDismiss(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
