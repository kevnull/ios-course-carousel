//
//  timelineViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/15/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class timelineViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var timelineImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = timelineImage.image!.size
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
