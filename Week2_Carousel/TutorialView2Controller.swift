//
//  TutorialView2Controller.swift
//  Week2_Carousel
//
//  Created by Noah Batterson on 9/28/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class TutorialView2Controller: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    @IBOutlet weak var beginButton: UIButton!
    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var pageFinder : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = pageFinder
        if tutorialScrollView.contentOffset.x >= 960 {
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.beginButton.alpha = 1.0
            })
        }
        else {
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.beginButton.alpha = 0
            })
        }
        
    }
    
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        
        tutorialScrollView.delegate = self


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
