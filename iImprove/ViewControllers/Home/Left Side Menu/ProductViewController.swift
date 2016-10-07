//
//  ProductViewController.swift
//  iImprove
//
//  Created by Xian Lee on 21/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var imgvPhoto: UIImageView!
    @IBAction func onBack(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgvPhoto.layer.masksToBounds = true
        imgvPhoto.layer.borderColor = UIColor(red: 69.0/255.0, green: 162.0/255.0, blue: 219.0/255.0, alpha: 1.0).cgColor
        imgvPhoto.layer.borderWidth = 3

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
