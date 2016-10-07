//
//  SelectPlatformViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class SelectPlatformViewController: UIViewController {
    @IBOutlet weak var viewStudent: UIView!
    @IBOutlet weak var viewTeacher: UIView!
    @IBOutlet weak var viewParent: UIView!
    @IBOutlet weak var viewCompany: UIView!
    @IBOutlet weak var btnNext: UIButton!

    @IBAction func onStudent(_ sender: AnyObject) {
        initAllViews()
        
        self.viewStudent.layer.borderColor = UIColor(red: 14.0/255.0, green: 114.0/255.0, blue: 167.0/255.0, alpha: 1.0).cgColor
        self.viewStudent.layer.borderWidth = 2
        self.viewStudent.layer.cornerRadius = 4.0
        self.viewStudent.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.viewStudent.layer.masksToBounds = true
    }
    
    @IBAction func onTeacher(_ sender: AnyObject) {
        initAllViews()
        
        self.viewTeacher.layer.borderColor = UIColor(red: 14.0/255.0, green: 114.0/255.0, blue: 167.0/255.0, alpha: 1.0).cgColor
        self.viewTeacher.layer.borderWidth = 2
        self.viewTeacher.layer.cornerRadius = 4.0
        self.viewTeacher.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.viewTeacher.layer.masksToBounds = true

    }
    
    @IBAction func onParent(_ sender: AnyObject) {
        initAllViews()
        
        self.viewParent.layer.borderColor = UIColor(red: 14.0/255.0, green: 114.0/255.0, blue: 167.0/255.0, alpha: 1.0).cgColor
        self.viewParent.layer.borderWidth = 2
        self.viewParent.layer.cornerRadius = 4.0
        self.viewParent.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.viewParent.layer.masksToBounds = true

    }

    @IBAction func onCompany(_ sender: AnyObject) {
        initAllViews()
        
        self.viewCompany.layer.borderColor = UIColor(red: 14.0/255.0, green: 114.0/255.0, blue: 167.0/255.0, alpha: 1.0).cgColor
        self.viewCompany.layer.borderWidth = 2
        self.viewCompany.layer.cornerRadius = 4.0
        self.viewCompany.backgroundColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        self.viewCompany.layer.masksToBounds = true

    }
    
    @IBAction func onNext(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_WALK_THROUGH))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }
    
    func initAllViews(){
        self.viewStudent.layer.borderColor = UIColor.lightGray.cgColor
        self.viewStudent.layer.borderWidth = 1
        self.viewStudent.layer.cornerRadius = 4.0
        self.viewStudent.backgroundColor = UIColor.clear
        self.viewStudent.layer.masksToBounds = true
        
        self.viewTeacher.layer.borderColor = UIColor.lightGray.cgColor
        self.viewTeacher.layer.borderWidth = 1
        self.viewTeacher.layer.cornerRadius = 4.0
        self.viewTeacher.backgroundColor = UIColor.clear
        self.viewTeacher.layer.masksToBounds = true
        
        self.viewParent.layer.borderColor = UIColor.lightGray.cgColor
        self.viewParent.layer.borderWidth = 1
        self.viewParent.layer.cornerRadius = 4.0
        self.viewParent.backgroundColor = UIColor.clear
        self.viewParent.layer.masksToBounds = true
        
        self.viewCompany.layer.borderColor = UIColor.lightGray.cgColor
        self.viewCompany.layer.borderWidth = 1
        self.viewCompany.layer.cornerRadius = 4.0
        self.viewCompany.backgroundColor = UIColor.clear
        self.viewCompany.layer.masksToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initAllViews()
        
        self.btnNext.layer.masksToBounds = true
        self.btnNext.layer.borderColor = UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0).cgColor
        self.btnNext.layer.borderWidth = 1
        self.btnNext.layer.cornerRadius = 4.0
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
