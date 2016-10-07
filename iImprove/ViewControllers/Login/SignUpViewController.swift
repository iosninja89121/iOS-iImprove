//
//  SignUpViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfBirthday: UITextField!
    @IBOutlet weak var viewSignup: UIView!
    @IBOutlet weak var viewFBLogin: UIView!
    
    @IBAction func onBack(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSignup(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_SELECT_PLATFORM))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }

    @IBAction func onFBLogin(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_SELECT_PLATFORM))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }
    
    @IBAction func goSignin(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func onTermsOfService(_ sender: AnyObject) {
    }

    @IBAction func onPrivacyPolicy(_ sender: AnyObject) {
    }
    
    @IBAction func onLiscence(_ sender: AnyObject) {
    }
    
    @IBAction func textFieldBirthdayEditing(_ sender: AnyObject) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        self.tfBirthday.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(SignUpViewController.datePickerValueChanged(_:)), for: UIControlEvents.valueChanged)

    }
    
    func datePickerValueChanged(_ sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        self.tfBirthday.text = dateFormatter.string(from: sender.date)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tfName.delegate = self
        self.tfEmail.delegate = self
        self.tfPassword.delegate = self
        self.tfBirthday.delegate = self
        
        self.viewSignup.layer.masksToBounds = true
        self.viewSignup.layer.borderColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0).cgColor
        self.viewSignup.layer.borderWidth = 1
        self.viewSignup.layer.cornerRadius = 4.0
        
        self.viewFBLogin.layer.masksToBounds = true
        self.viewFBLogin.layer.borderColor = UIColor(red: 78.0/255.0, green: 94.0/255.0, blue: 170.0/255.0, alpha: 1.0).cgColor
        self.viewFBLogin.layer.borderWidth = 1
        self.viewFBLogin.layer.cornerRadius = 4.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func processData(){
        SVProgressHUD .showSuccess(withStatus: "data process")
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        if(textField == self.tfName){
            self.tfName.resignFirstResponder()
            self.tfEmail.becomeFirstResponder()
        }else if(textField == self.tfEmail){
            self.tfEmail.resignFirstResponder()
            self.tfPassword.becomeFirstResponder()
        }else if(textField == self.tfPassword){
            self.tfPassword.resignFirstResponder()
            self.tfBirthday.becomeFirstResponder()
        }else if(textField == self.tfBirthday){
            self.tfBirthday.resignFirstResponder()
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
