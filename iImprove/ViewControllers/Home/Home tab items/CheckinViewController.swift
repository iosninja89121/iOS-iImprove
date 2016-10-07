//
//  CheckinViewController.swift
//  iImprove
//
//  Created by Prince on 12/16/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class CheckinViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblCheckin: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblCheckin.dataSource = self
        tblCheckin.delegate = self
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
    // MARK: - TableView Delegate and DataSource
    func numberOfSections(in tableView: UITableView) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch (section){
        case 0:
            return 4
        case 1:
            return 3
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row){
        case (0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_TOP_GENERAL, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "News Feed"
            
            return cell
            
        case (0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_USER_INFO, for: indexPath)
            let imageView = cell.contentView.viewWithTag(1) as! UIImageView
            let lblFirst = cell.contentView.viewWithTag(2) as! UILabel
            let lblSecond = cell.contentView.viewWithTag(3) as! UILabel
            let lblTime = cell.contentView.viewWithTag(4) as! UILabel
            
            imageView.image = UIImage(named: "ic_crown")
            lblFirst.text = "Sponsored"
            lblSecond.isHidden = true
            lblTime.text = "22 mins"
            
            return cell
            
        case (0, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_POST_GENERAL, for: indexPath)
            return cell
            
        case (0, 3):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_BOTTOM_INFO, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            let btnCount = cell.contentView.viewWithTag(2) as! UIButton
            
            lblTitle.text = "View all trending news"
            btnCount.setTitle("7+", for: UIControlState())
            btnCount.layer.masksToBounds = true
            btnCount.layer.cornerRadius = 4.0
            
            return cell
            
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_TOP_GENERAL, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Connection requests"
            
            return cell
            
        case (1, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_USER_STATUS, for: indexPath)
            let btnClose = cell.contentView.viewWithTag(4)
            let btnCheck = cell.contentView.viewWithTag(5)
            
            btnClose?.layer.masksToBounds = true
            btnClose?.layer.cornerRadius = 12.5
            btnClose?.layer.borderWidth = 0.5
            btnClose?.layer.borderColor = UIColor(red: 76.0/255.0, green: 166.0/255.0, blue: 216.0/255.0, alpha: 1.0).cgColor
            
            btnCheck?.layer.masksToBounds = true
            btnCheck?.layer.cornerRadius = 12.5
            btnCheck?.layer.borderWidth = 0.5
            btnCheck?.layer.borderColor = UIColor(red: 76.0/255.0, green: 166.0/255.0, blue: 216.0/255.0, alpha: 1.0).cgColor
            
            return cell
            
        case (1, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_BOTTOM_INFO, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            let btnCount = cell.contentView.viewWithTag(2) as! UIButton
            
            lblTitle.text = "View all requests"
            btnCount.setTitle("12+", for: UIControlState())
            btnCount.layer.masksToBounds = true
            btnCount.layer.cornerRadius = 4.0
            
            return cell
            
        case (2, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_TOP_GENERAL, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.isHidden = true
            
            return cell
            
        case (2, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_USER_INFO, for: indexPath)
            let imageView = cell.contentView.viewWithTag(1) as! UIImageView
            let lblFirst = cell.contentView.viewWithTag(2) as! UILabel
            let lblSecond = cell.contentView.viewWithTag(3) as! UILabel
            let lblTime = cell.contentView.viewWithTag(4) as! UILabel
            
            imageView.image = UIImage(named: "ic_dollar")
            lblFirst.text = "Selling"
            lblSecond.text = "PDF"
            lblTime.text = "2 hrs"
            
            return cell
            
        case (2, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_POST_PRODUCT, for: indexPath)
            let btnBuy = cell.contentView.viewWithTag(8)
            
            btnBuy?.layer.masksToBounds = true
            btnBuy?.layer.cornerRadius = 4.0
            
            return cell
            
        case (2, 3):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_POST_STATUS, for: indexPath)
            return cell
            
        case (2, 4):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_BOTTOM_CONTROL, for: indexPath)
            return cell
            
        default: break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        switch((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row){
            
        case (0, 0):
            return 25
            
        case (0, 1):
            return 100
            
        case (0, 2):
            return 44
            
        case (0, 3):
            return 50
            
        case (1, 0):
            return 25
            
        case (1, 1):
            return 100
            
        case (1, 2):
            return 50
            
        case (2, 0):
            return 25
            
        case (2, 1):
            return 100
            
        case (2, 2):
            return 80
            
        case (2, 3):
            return 30
            
        case (2, 4):
            return 35
            
        default: break
        }
        
        return 0
    }
}
