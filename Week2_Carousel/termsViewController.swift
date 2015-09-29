//
//  termsViewController.swift
//  Week2_Carousel
//
//  Created by Noah Batterson on 9/28/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class termsViewController: UIViewController {
    
    @IBOutlet weak var termsWebView: UIWebView!
    
    @IBAction func webViewBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let URL = NSURL(string: "https://www.dropbox.com/terms?mobile=1")
        termsWebView.loadRequest(NSURLRequest(URL: URL!))
        
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
