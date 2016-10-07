//
//  BuildProfileViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class BuildProfileViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfBirthday: UITextField!
    @IBOutlet weak var tfMale: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var imgvPhoto: UIImageView!

    @IBAction func onBack(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onDone(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_BUILD_NETWORK))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)

    }
    
    @IBAction func onUploadPhoto(_ sender: AnyObject) {
    }
    
    @IBAction func onSave(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_BUILD_NETWORK))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imgvPhoto.layer.borderColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0).cgColor
        self.imgvPhoto.layer.borderWidth = 2
        self.imgvPhoto.layer.cornerRadius = 50.0
        self.imgvPhoto.layer.masksToBounds = true
        
        self.btnSave.layer.borderColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0).cgColor
        self.btnSave.layer.borderWidth = 2
        self.btnSave.layer.cornerRadius = 4.0
        self.btnSave.layer.masksToBounds = true
        
        self.tfName.isEnabled = false
        self.tfEmail.isEnabled = false
        self.tfPassword.isEnabled = false
        self.tfBirthday.isEnabled = false
        self.tfMale.isEnabled = false
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
