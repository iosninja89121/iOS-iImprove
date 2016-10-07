//
//  LeftSideMenuViewController.swift
//  iImprove
//
//  Created by Prince on 12/16/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class LeftSideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblSideMenu: UITableView!
    var nSelectedIndex:Int = 0
    var isExpanded:Bool = false
    

    @IBAction func onBuy(_ sender: AnyObject) {
        nSelectedIndex = 0
        tblSideMenu.reloadData()
    }
  
    @IBAction func onSell(_ sender: AnyObject) {
        nSelectedIndex = 1
        tblSideMenu.reloadData()
    }
    
    @IBAction func onSetting(_ sender: AnyObject) {
        nSelectedIndex = 2
        tblSideMenu.reloadData()
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblSideMenu.delegate = self
        self.tblSideMenu.dataSource = self
        
        self.tblSideMenu.separatorColor = UIColor(red: 68.0/255.0, green: 163.0/255.0, blue: 219.0/255.0, alpha: 1.0)
        self.tblSideMenu.layoutMargins = UIEdgeInsets.zero
        self.tblSideMenu.separatorInset = UIEdgeInsets.zero
        
        self.tblSideMenu.tableFooterView = UIView();
        
        //This is test part for commission.
        nSelectedIndex = 0
    }
    
    func onCheckout(){
        NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_CHECKOUT), object: nil)
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Delegate and DataSource
    func numberOfSections(in tableView: UITableView) -> Int{
        if(nSelectedIndex == 2){
            return 1
        }
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch (nSelectedIndex, section){
        case (0, 0):
            return 3
        case (0, 1):
            return 4
        case (1, 0):
            return 2
        case (1, 1):
            return 1
        case (2, 0):
            if(isExpanded){
                return 7
            }
            
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_SECTION)
        headerCell?.backgroundColor = UIColor.clear
        
        let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
        
        switch (nSelectedIndex, section){
        case (0, 0):
            lblTitle.text = "My Cart"
            break
        case (0, 1):
            lblTitle.text = "Activity"
            break
        case (1, 0):
            lblTitle.text = "My Shop"
            break
        case (1, 1):
            lblTitle.text = "Activity"
            break
        case (2, 0):
            lblTitle.text = "My Settings"
            break
        default: break

        }
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var nRow:Int = (indexPath as NSIndexPath).row

        if(isExpanded && nSelectedIndex == 2){
            if(nRow < 2){
                
            }else if(nRow < 4){
                nRow = nRow + 3
            }else{
                nRow = nRow - 2
            }
        }
        
        switch(nSelectedIndex, (indexPath as NSIndexPath).section, nRow){
        case (0, 0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_cart")
            lblTitle.text = "Cart Summary:"
            lblSmall.text = "(2) Items"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = false
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (0, 0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            lblTitle.text = "TOTAL"
            lblBold.text = "$40.24"
            
            imgvIcon.isHidden = true
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = false
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (0, 0, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_3, for: indexPath)
            let button = cell.contentView.viewWithTag(1) as! UIButton
            
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 5
            
            button.addTarget(self, action: #selector(LeftSideMenuViewController.onCheckout), for: .touchUpInside)
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (0, 1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_history_new")
            lblTitle.text = "My Purchase History"
            
            button.setTitle("4", for: UIControlState())
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 5
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = false
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (0, 1, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_eye_new")
            lblTitle.text = "Saved Items"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (0, 1, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_group_new")
            lblTitle.text = "Sellers you follow"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (0, 1, 3):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_star_new")
            lblTitle.text = "Feedback"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (1, 0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_add_new")
            lblTitle.text = "Sell an Item"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (1, 0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_end_new")
            lblTitle.text = "End Listing"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (1, 1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_history_new")
            lblTitle.text = "My Sell History"
            button.setTitle("4", for: UIControlState())
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 5
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            button.isHidden = false
            lblSmall.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (2, 0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_1, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "General"
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell

        case (2, 0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_4, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            let imgvIcon = cell.contentView.viewWithTag(2) as! UIImageView
            
            lblTitle.text = "Privacy"
            
            if(isExpanded){
                imgvIcon.image = UIImage(named: "ic_contracted")
            }else{
                imgvIcon.image = UIImage(named: "ic_expanded")
            }
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (2, 0, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_1, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Payment"
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
        
        case (2, 0, 3):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_1, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Terms of Use"
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (2, 0, 4):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_2, for: indexPath)
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            let lblTitle = cell.contentView.viewWithTag(2) as! UILabel
            let lblSmall = cell.contentView.viewWithTag(3) as! UILabel
            let button = cell.contentView.viewWithTag(4) as! UIButton
            let lblBold = cell.contentView.viewWithTag(5) as! UILabel
            
            imgvIcon.image = UIImage(named: "ic_signout_new")
            lblTitle.text = "Sign Out"
            
            imgvIcon.isHidden = false
            lblTitle.isHidden = false
            lblSmall.isHidden = true
            button.isHidden = true
            lblBold.isHidden = true
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 143.0 / 255.0, blue: 206.0/255.0, alpha: 1.0)
            
            return cell
            
        case (2, 0, 5):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_5, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            lblTitle.text = "Terms Of Service"
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 100.0 / 255.0, blue: 180.0/255.0, alpha: 1.0)
            
            return cell
            
        case (2, 0, 6):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_LEFT_MENU_5, for: indexPath)
            let lblTitle = cell.contentView.viewWithTag(1) as! UILabel
            lblTitle.text = "Privacy Policy"
            
            cell.layoutMargins = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = UIColor(red: 0.0 / 255.0, green: 100.0 / 255.0, blue: 180.0/255.0, alpha: 1.0)
            
            return cell
        
        default: break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
                
        return 44
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        if(nSelectedIndex == 0 && (indexPath as NSIndexPath).section == 0){
            return nil
        }
        
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        cell.contentView.backgroundColor = UIColor.darkGray
        
        switch (nSelectedIndex, (indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row){
        case (0, 1, 0):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_PURCHASED_HISTORY), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_history_selected")
            
            break
            
        case (0, 1, 1):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_SAVED_ITEMS), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_eye_selected")
            
            break
            
        case (0, 1, 2):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_SELLERS_FOLLOW), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_group_selected")
            
            break
            
        case (0, 1, 3):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_FEEDBACK), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_star_selected")
            
            break
            
        case (1, 0, 0):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_SELL_ITEM), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_add_selected")
            
            break
            
        case (1, 0, 1):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_RATING), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_end_selected")
            
            break
            
        case (1, 1, 0):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_SELL_HISTORY), object: nil)
            
            let imgvIcon = cell.contentView.viewWithTag(1) as! UIImageView
            imgvIcon.image = UIImage(named: "ic_history_selected")
            
            break
            
        case (2, 0, 0):
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_SOLD), object: nil)
            break
        
        case (2, 0, 1):
            isExpanded = !isExpanded
            tableView.reloadSections(IndexSet(integer: (indexPath as NSIndexPath).section), with: UITableViewRowAnimation.fade)
            return indexPath
            
        default:
            break
        }
        
        
        
        self.menuContainerViewController.toggleLeftSideMenuCompletion({
            tableView.reloadData()
        })
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
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
