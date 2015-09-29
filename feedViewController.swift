//
//  feedViewController.swift
//  Week2_Carousel
//
//  Created by Noah Batterson on 9/28/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class feedViewController: UIViewController {
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedNavImageView: UIImageView!
    @IBAction func chatButton(sender: AnyObject) {
    }
    @IBAction func settingsButton(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        feedScrollView.contentSize = CGSize(width: 320, height: 1660)
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
