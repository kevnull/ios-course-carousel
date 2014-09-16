//
//  tourViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/15/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class tourViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pageControlIsChanging : Bool = false
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        pageControlIsChanging = false


    }

    func scrollViewDidScroll(_scrollView: UIScrollView) {
        if (pageControlIsChanging) {
            return
        }

        // Get the current page based on the scroll offset
//        var page : Int = Int((round(scrollView.contentOffset.x - 200 / 2)/200)+1)
//        
//        println("\(scrollView.contentOffset.x) page \(page)")
//        // Set the current page, so the dots will update
//        pageControl.currentPage = page
    }
    
//    @IBAction func changePage(sender: AnyObject) {
//        var frame : CGRect = scrollView.frame
//        frame.origin.x = frame.size.width * CGFloat(pageControl.currentPage)
//        println("here")
//        frame.origin.y = 0
//        
//        scrollView.scrollRectToVisible(frame, animated: true)
//        pageControlIsChanging = true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self


        // Do any additional setup after loading the view.
//        pageControl.numberOfPages = 4
//        pageControl.currentPage = 1

        scrollView.contentSize = CGSizeMake(1280, imageView.frame.height)

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
