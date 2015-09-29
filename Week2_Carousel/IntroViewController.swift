//
//  IntroViewController.swift
//  Week2_Carousel
//
//  Created by Noah Batterson on 9/24/15.
//  Copyright © 2015 Noah Batterson. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var IntroScrollView: UIScrollView!
    @IBOutlet weak var IntroImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var xOffsetsStart: [Float] = [-60, 40, 10, -40, 28, -100]
    var yOffsetsStart : [Float] = [-295, -260, -430, -520, -420, -500]
    var scalesStart : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotationsStart : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(Value:Float, r1Min:Float, r1Max:Float, r2Min:Float, r2Max:Float)->Float{
        let ratio = (r2Max - r2Min)/(r1Max - r1Min)
        return Value*ratio - r1Min*ratio  + r2Min
    }
    
    func updateViewTransformsWithOffset(offset: Float){
        let tiles = [tile1View,tile2View,tile3View,tile4View,tile5View,tile6View ]
        
        for index in 0...5{
            let tile = tiles[index]
            
            let tx = convertValue(offset, r1Min: -20, r1Max: 568, r2Min:xOffsetsStart[index], r2Max:0)
            let ty = convertValue(offset, r1Min: -20, r1Max: 568, r2Min:yOffsetsStart[index], r2Max:0)
            let scale = convertValue(offset, r1Min: -20, r1Max: 568, r2Min: scalesStart[index], r2Max:1)
            let rotation = convertValue(offset, r1Min: -20, r1Max: 568, r2Min:rotationsStart[index], r2Max:0)
            
            tile.transform = CGAffineTransformMakeTranslation(CGFloat(tx),CGFloat(ty))
            tile.transform = CGAffineTransformScale(tile.transform,CGFloat(scale),CGFloat(scale))
            tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(Double(rotation) * M_PI / 180))
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IntroScrollView.delegate = self
        IntroScrollView.contentSize = IntroImageView.image!.size

        // Do any additional setup after loading the view.
    

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = Float(scrollView.contentOffset.y)
        
        updateViewTransformsWithOffset(offset)
        
        
    
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
