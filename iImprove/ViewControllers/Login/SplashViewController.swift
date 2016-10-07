//
//  SplashViewController.swift
//  iImprove
//
//  Created by Xian Lee on 25/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SplashViewController.someSelector), userInfo: nil, repeats: false)
    }
    
    func someSelector() {
        // Something after a delay
        let vcSignin = storyboard?.instantiateViewController(withIdentifier: VC_SIGNIN) as! SignInViewController
        self.navigationController!.pushViewController(vcSignin, animated: true)
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
