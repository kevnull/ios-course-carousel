//
//  createViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/15/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class createViewController: UIViewController {


    @IBOutlet weak var termsCheck: UIButton!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!
    @IBOutlet weak var createForm: UIImageView!
    @IBOutlet weak var agreeToTerms: UIImageView!
    @IBOutlet weak var terms: UIButton!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var instructionsText: UIImageView!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func checkSignUp () {
        var alertView : UIAlertView
        
        if (self.nameText.text.isEmpty) {
            alertView = UIAlertView(title: "What's Your Name?", message: "Hi, I'm Carousel, what's your name?", delegate: self, cancelButtonTitle: "Lemme tell you…")
            alertView.show()
        } else if (self.emailText.text.isEmpty) {
            alertView = UIAlertView(title: "No Email", message: "Email address is required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (self.passwordText.text.isEmpty) {
            alertView = UIAlertView(title: "No Password", message: "Password is required", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (self.confirmText.text.isEmpty) {
            alertView = UIAlertView(title: "Confirm Password", message: "Please enter your password twice to confirm it", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (self.passwordText.text != self.confirmText.text) {
            alertView = UIAlertView(title: "Confirm Password", message: "Passwords don't match", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (!self.termsCheck.selected) {
            alertView = UIAlertView(title: "Terms", message: "Please agree to terms", delegate: self, cancelButtonTitle: "But it's so long…")
            alertView.show()
        } else {
            alertView = UIAlertView(title: "Creating account…", message: nil, delegate: self, cancelButtonTitle: nil)
                alertView.show()
            delay(2) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("signupSegue", sender: self)
            }
        }
    }
    @IBAction func createButton(sender: AnyObject) {
        checkSignUp()
    }
    @IBAction func termsButton(sender: AnyObject) {
        termsCheck.selected = !termsCheck.selected
    }
    @IBAction func dismissButton(sender: AnyObject) {        navigationController?.popToRootViewControllerAnimated(true)
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
        println(animationCurve)
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {

            self.create.frame.origin.y = 469 - kbSize.height
            self.agreeToTerms.frame.origin.y = 523 - kbSize.height
            self.terms.frame.origin.y = 525 - kbSize.height
            self.termsCheck.frame.origin.y = 529 - kbSize.height

            self.createForm.frame.origin.y = 125 - self.instructionsText.frame.size.height
            self.nameText.frame.origin.y = 141 - self.instructionsText.frame.size.height
            self.emailText.frame.origin.y = 184 - self.instructionsText.frame.size.height
            self.passwordText.frame.origin.y = 228 - self.instructionsText.frame.size.height
            self.confirmText.frame.origin.y = 271 - self.instructionsText.frame.size.height
            self.instructionsText.frame.origin.y = 64 - self.instructionsText.frame.size.height
            
            
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
        
        
        /// TODO: Programmatically store all initial positions to be restored to at any point with a restore function
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.create.frame.origin.y = 469
            self.agreeToTerms.frame.origin.y = 523
            self.terms.frame.origin.y = 525
            self.termsCheck.frame.origin.y = 529
            self.createForm.frame.origin.y = 125
            self.nameText.frame.origin.y = 141
            self.emailText.frame.origin.y = 184
            self.passwordText.frame.origin.y = 228
            self.confirmText.frame.origin.y = 271
            self.instructionsText.frame.origin.y = 64
            
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        
    }
    @IBAction func keyboardDismiss(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        termsCheck.setImage(UIImage (named:"check_box"), forState: UIControlState.Normal)
        termsCheck.setImage(UIImage (named:"check_box_selected"), forState: UIControlState.Selected)

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
