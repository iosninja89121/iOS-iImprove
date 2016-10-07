//
//  SignInViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignInViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var viewFBLogin: UIView!
    @IBOutlet weak var viewSignin: UIView!

    @IBAction func onFacebookLogin(_ sender: AnyObject) {
        appDelegate.transferToHome()
    }
    
    @IBAction func onUsernameLogin(_ sender: AnyObject) {
        appDelegate.transferToHome()
    }
    
    @IBAction func onForgotPassword(_ sender: AnyObject) {
    }
    
    @IBAction func onSignup(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_SINGUP))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }
    
    @IBAction func onTermsOfService(_ sender: AnyObject) {
    }
    
    @IBAction func onPrivacyPolicy(_ sender: AnyObject) {
    }
    
    @IBAction func onLiscenceAgreements(_ sender: AnyObject) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.tfUsername.delegate = self
        self.tfPassword.delegate = self

        // Do any additional setup after loading the view.
        self.viewSignin.layer.masksToBounds = true
        self.viewSignin.layer.borderColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0).cgColor
        self.viewSignin.layer.borderWidth = 1
        self.viewSignin.layer.cornerRadius = 4.0
        
        self.viewFBLogin.layer.masksToBounds = true
        self.viewFBLogin.layer.borderColor = UIColor(red: 78.0/255.0, green: 94.0/255.0, blue: 170.0/255.0, alpha: 1.0).cgColor
        self.viewFBLogin.layer.borderWidth = 1
        self.viewFBLogin.layer.cornerRadius = 4.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func processData(){
        SVProgressHUD .showSuccess(withStatus: "data process")
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        if(textField == self.tfUsername){
            self.tfUsername.resignFirstResponder()
            self.tfPassword.becomeFirstResponder()
        }else if(textField == self.tfPassword){
            self.tfPassword.resignFirstResponder()
            processData()
        }
        
        return true
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
