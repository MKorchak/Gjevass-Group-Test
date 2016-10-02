//
//  MainViewController.swift
//  test
//
//  Created by Misha Korchak on 02.10.16.
//  Copyright © 2016 Misha Korchak. All rights reserved.
//

import UIKit
var k = 0

class MainViewController: UIViewController {
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ScrollView2: UIScrollView!
    @IBAction func Button1(_ sender: UIButton) {
        k = 0
    }
    @IBAction func Button2(_ sender: UIButton) {
        k = 1
    }
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.contentSize.height = 3132
        ScrollView2.contentSize.width = 645
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
