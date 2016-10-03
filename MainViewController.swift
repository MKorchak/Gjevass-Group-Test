//
//  MainViewController.swift
//  test
//
//  Created by Misha Korchak on 02.10.16.
//  Copyright © 2016 Misha Korchak. All rights reserved.
//

import UIKit
var k = 0
var y: CGFloat = 0
var x: CGFloat = 0

class MainViewController: UIViewController {
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ScrollView2: UIScrollView!
    @IBAction func Button1(_ sender: UIButton) {
        k = 0
        y = ScrollView.contentOffset.y
        x = ScrollView2.contentOffset.x
    }
    @IBAction func Button2(_ sender: UIButton) {
        k = 1
        y = ScrollView.contentOffset.y
        x = ScrollView2.contentOffset.x
    }
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var light: UIImageView!
    @IBOutlet weak var stick: UIImageView!
    @IBOutlet weak var stick2: UIImageView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lightning()
        
        
        
        light.alpha = 0
        
        sticking()
        
        stick2.transform = CGAffineTransform(rotationAngle: 0.047
        )
        
        image1.transform = CGAffineTransform(rotationAngle: 0.02)
        image2.transform = CGAffineTransform(rotationAngle: 0.047)
        ScrollView.contentSize.height = 3132
        ScrollView2.contentSize.width = 645
        ScrollView.contentOffset.y = y
        ScrollView2.contentOffset.x = x
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lightning() {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.light.alpha = 1
            
            }, completion: { (Completed: Bool) -> Void in
                
                UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    
                    self.light.alpha = 0
                    
                    }, completion: { (Completed: Bool) -> Void in
                        
                        self.lightning()
                        
                })
                
        })
        
    }
    
    func sticking() {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.stick2.transform = CGAffineTransform(rotationAngle: -0.047)
            
            }, completion: { (Completed: Bool) -> Void in
                
                UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    
                    self.stick2.transform = CGAffineTransform(rotationAngle: 0.047)
                    
                    }, completion: { (Completed: Bool) -> Void in
                        
                        self.sticking()
                        
                })
                
        })
        
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
