//
//  IntroViewController.swift
//  ios-course-carousel
//
//  Created by Kevin Cheng on 9/9/14.
//  Copyright (c) 2014 Kevin Cheng. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!

    @IBOutlet weak var tile1Image: UIImageView!
    @IBOutlet weak var tile2Image: UIImageView!
    @IBOutlet weak var tile3Image: UIImageView!
    @IBOutlet weak var tile4Image: UIImageView!
    @IBOutlet weak var tile5Image: UIImageView!
    @IBOutlet weak var tile6Image: UIImageView!

    // TODO: named constants would be better
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-90, 25, 25, 70, -120, -90]
    var sOffsets : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rOffsets : [Float] = [-10, -10, 10, 10, 10, -10]

    let SCROLL_OFFSET_MAX : Float = 568

    // given scale of x to y, find where value fits on scale of a to b
    func transformValue (value : Float, x : Float, y : Float, a : Float, b: Float) -> Float {
        return (value/(y-x)*(b-a))+a
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = introImage.image!.size
        scrollView.sendSubviewToBack(introImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getTilePosition(index: Int, offset: Float) -> (x: CGFloat, y: CGFloat, s: CGFloat, r: CGFloat) {
        var x = CGFloat(transformValue( offset, x: 0, y: SCROLL_OFFSET_MAX, a: xOffsets[index], b: 0 ))
        var y = CGFloat(transformValue( offset, x: 0, y: SCROLL_OFFSET_MAX, a: yOffsets[index], b: 0 ))
        var s = CGFloat(transformValue( offset, x: 0, y: SCROLL_OFFSET_MAX, a: sOffsets[index], b: 1 ))
        var r = CGFloat(Double(transformValue( offset, x: 0, y: SCROLL_OFFSET_MAX, a: rOffsets[index], b: 0 )) * M_PI / 180)

        return (x, y, s, r)
    }
    
    // any offset changes
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)

        var tx, ty, ts, tr: CGFloat
        var tilePosition : (x: CGFloat, y: CGFloat, s: CGFloat, r: CGFloat)

        var imageViewArray : [UIImageView] = [tile1Image, tile2Image, tile3Image, tile4Image, tile5Image, tile6Image]

        // ideally would like to use an array here and reference each view through a loop
        
        var currImageView : UIImageView
    
        for var i = 0; i < imageViewArray.count; ++i {
            currImageView = imageViewArray[i]
            tilePosition = getTilePosition(i, offset: offset)

            currImageView.transform = CGAffineTransformMakeTranslation(tilePosition.x, tilePosition.y)
            currImageView.transform = CGAffineTransformScale(currImageView.transform, tilePosition.s, tilePosition.s)
            currImageView.transform = CGAffineTransformRotate(currImageView.transform, tilePosition.r)
        }

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
