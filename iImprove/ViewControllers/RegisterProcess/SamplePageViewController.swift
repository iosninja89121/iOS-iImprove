//
//  SamplePageViewController.swift
//  iImprove
//
//  Created by Xian Lee on 24/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class SamplePageViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgvContent: UIImageView!
    
    // MARK: - Variables
    var itemIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTitle.text = "Image \(itemIndex)"
        imgvContent.image = UIImage(named: "nature_\(itemIndex)")
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
