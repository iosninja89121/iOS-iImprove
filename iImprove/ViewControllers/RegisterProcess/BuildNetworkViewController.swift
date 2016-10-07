//
//  BuildNetworkViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class BuildNetworkViewController: UIViewController {
    @IBOutlet weak var viewFacebook: UIView!
    @IBOutlet weak var viewGmail: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var lblFacebook: UILabel!
    @IBOutlet weak var lblGmail: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnInvite: UIButton!

    @IBAction func onFacebook(_ sender: AnyObject) {
        initAllViews()
        self.viewFacebook.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.lblFacebook.textColor = UIColor.white
    }
    
    @IBAction func onGmail(_ sender: AnyObject) {
        initAllViews()
        self.viewGmail.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.lblGmail.textColor = UIColor.white
    }
    
    @IBAction func onEmail(_ sender: AnyObject) {
        initAllViews()
        self.viewEmail.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.lblEmail.textColor = UIColor.white
    }
    
    @IBAction func onSkip(_ sender: AnyObject) {
        
        appDelegate.transferToHome()
    }
    
    @IBAction func onInvite(_ sender: AnyObject) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.btnInvite.layer.masksToBounds = true
        self.btnInvite.layer.cornerRadius = 4
        self.btnInvite.layer.borderColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0).cgColor
        self.btnInvite.layer.borderWidth = 1
        
        initAllViews()
    }
    
    func initAllViews(){
        self.viewFacebook.backgroundColor = UIColor.white
        self.viewGmail.backgroundColor = UIColor.white
        self.viewEmail.backgroundColor = UIColor.white
        
        self.lblFacebook.textColor = UIColor.lightGray
        self.lblGmail.textColor = UIColor.lightGray
        self.lblEmail.textColor = UIColor.lightGray
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
