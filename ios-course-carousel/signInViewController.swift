//
//  signInViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/15/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {

    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    @IBOutlet weak var signInStatus: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func checkPassword () {
        var alertView : UIAlertView
        
        if (self.emailText.text == "kc@kevnull.com" && self.passwordText.text == "password") { performSegueWithIdentifier("loginSegue", sender: self)
        }
        else if (self.emailText.text.isEmpty) {
            alertView = UIAlertView(title: "No Email", message: "Email address is required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else if (self.passwordText.text.isEmpty) {
            alertView = UIAlertView(title: "No Password", message: "Password is required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else {
            alertView = UIAlertView(title: "Incorrect Login", message: "Couldn't find a valid email/password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        }
    }
    @IBAction func signInButton(sender: AnyObject) {
        var alertView : UIAlertView
        alertView = UIAlertView(title: "Signing in…", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView.show()
        delay(2) {
            self.checkPassword()
            alertView.dismissWithClickedButtonIndex(0, animated: true)
        }

    }
    @IBAction func clearKeyButton(sender: AnyObject) {

    }
    @IBAction func keyboardDismiss(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.signinButton.frame.origin.y = 455 - kbSize.height
            self.forgotButton.frame.origin.y = 510 - kbSize.height
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
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
            self.signinButton.frame.origin.y = 455
            
            self.forgotButton.frame.origin.y = 510
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
