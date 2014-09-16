//
//  tourViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/15/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class tourViewController: UIViewController, UIScrollViewDelegate {

    let PAGE_WIDTH = 320
    let NUM_PAGES = 4
    var lastPage : Bool = false
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var backupButton: UIButton!
    @IBOutlet weak var backupSwitch: UISwitch!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int((round(scrollView.contentOffset.x - CGFloat(PAGE_WIDTH) / 2)/CGFloat(PAGE_WIDTH))+1)
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if (page == NUM_PAGES-1) {
            UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {
                self.backupButton.alpha = 1
                self.backupSwitch.alpha = 1
                self.pageControl.alpha = 0
            }, completion: nil)
            lastPage = true
        }
        
        if (lastPage && page < NUM_PAGES-1) {
            UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {
                self.backupButton.alpha = 0
                self.backupSwitch.alpha = 0
                self.pageControl.alpha = 1
                }, completion: nil)
            lastPage = false
        }
    }

    func scrollViewDidScroll(_scrollView: UIScrollView) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        self.backupButton.alpha = 0
        self.backupSwitch.alpha = 0
        self.backupButton.frame.origin.x += CGFloat((NUM_PAGES-1)*PAGE_WIDTH)
        self.backupSwitch.frame.origin.x += CGFloat((NUM_PAGES-1)*PAGE_WIDTH)


        // Do any additional setup after loading the view.
        pageControl.numberOfPages = NUM_PAGES
        pageControl.currentPage = 0

        scrollView.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height)
        scrollView.contentSize = CGSizeMake(CGFloat(NUM_PAGES*PAGE_WIDTH), imageView.frame.height)
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
