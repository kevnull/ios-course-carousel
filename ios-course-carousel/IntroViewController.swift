//
//  IntroViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/9/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!

    @IBOutlet weak var tile1Image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = introImage.image!.size
        
        // set tile 1 initial position
        tile1Image.transform = CGAffineTransformMakeRotation(CGFloat(45 * M_PI / 180))
        println((tile1Image.frame.origin.x))
        println((tile1Image.frame.origin.y))
        tile1Image.frame.origin.x = 22.5553031655775
        println(tile1Image.hidden)
        println((tile1Image.frame.origin.x))
        println((tile1Image.frame.origin.y))
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
