//
//  RightSideMenuViewController.swift
//  iImprove
//
//  Created by Prince on 12/16/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class RightSideMenuViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblSideMenu: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var nSelectedIndex:Int = 0
    
    
    @IBAction func onFriendRequests(_ sender: AnyObject) {
        nSelectedIndex = 0
        self.tblSideMenu.separatorColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        tblSideMenu.backgroundColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        tblSideMenu.reloadData()
        lblTitle.text = "Friend Requests"
    }
    
    @IBAction func onContacts(_ sender: AnyObject) {
        nSelectedIndex = 1
        self.tblSideMenu.separatorColor = UIColor(red: 68.0/255.0, green: 163.0/255.0, blue: 219.0/255.0, alpha: 1.0)
        tblSideMenu.backgroundColor = UIColor(red: 1.0 / 255.0, green: 145.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
        tblSideMenu.reloadData()
        lblTitle.text = "Connections"
    }
    
    @IBAction func onMsg(_ sender: AnyObject) {
        nSelectedIndex = 2
        self.tblSideMenu.separatorColor = UIColor(red: 68.0/255.0, green: 163.0/255.0, blue: 219.0/255.0, alpha: 1.0)
        tblSideMenu.backgroundColor = UIColor(red: 1.0 / 255.0, green: 145.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0)
        tblSideMenu.reloadData()
        lblTitle.text = "Inbox"
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblSideMenu.delegate = self
        self.tblSideMenu.dataSource = self
        
        self.tblSideMenu.separatorColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.tblSideMenu.layoutMargins = UIEdgeInsets.zero
        self.tblSideMenu.separatorInset = UIEdgeInsets.zero
        
        self.tblSideMenu.tableFooterView = UIView();
        
        //This is test part for commission.
        nSelectedIndex = 0
    }
    
    func onTurnOn(){
        NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_CHAT_AVAILABILITY_TURN_ON), object: nil)
        self.menuContainerViewController.toggleRightSideMenuCompletion(nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Delegate and DataSource
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch nSelectedIndex{
        case 0:
            return 5
        case 1:
            return 7
        default:
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if(nSelectedIndex == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_1, for: indexPath)
            
            cell.layoutMargins = UIEdgeInsets.zero
            
            return cell
            
        } else if(nSelectedIndex == 1){
            if((indexPath as NSIndexPath).row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_3, for: indexPath)
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_2, for: indexPath)
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            }
        } else if(nSelectedIndex == 2){
            switch (indexPath as NSIndexPath).row{
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_4, for: indexPath)
                
                let lblCellTitle = cell.contentView.viewWithTag(1) as! UILabel
                let lblCellNumber = cell.contentView.viewWithTag(2)
                
                lblCellTitle.text = "Compose Message"
                lblCellNumber?.isHidden = true
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_4, for: indexPath)
                
                let lblCellTitle = cell.contentView.viewWithTag(1) as! UILabel
                let lblCellNumber = cell.contentView.viewWithTag(2) as! UILabel
                
                lblCellTitle.text = "All Messages"
                lblCellNumber.isHidden = false
                lblCellNumber.text = "(14)"
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_4, for: indexPath)
                
                let lblCellTitle = cell.contentView.viewWithTag(1) as! UILabel
                let lblCellNumber = cell.contentView.viewWithTag(2) as! UILabel
                
                lblCellTitle.text = "From iImprove"
                lblCellNumber.isHidden = false
                lblCellNumber.text = "(2)"
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_5, for: indexPath)
                let lblCellTitle = cell.contentView.viewWithTag(1) as! UILabel
                
                lblCellTitle.text = "Sent"
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_5, for: indexPath)
                let lblCellTitle = cell.contentView.viewWithTag(1) as! UILabel
                
                lblCellTitle.text = "Folders"
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_RIGHT_MENU_5, for: indexPath)
                let lblCellTitle = cell.contentView.viewWithTag(1) as! UILabel
                
                lblCellTitle.text = "Trash"
                
                cell.layoutMargins = UIEdgeInsets.zero
                
                return cell
                
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var height:CGFloat = 44
        
        if(nSelectedIndex == 2){
            height = 30
            
            if((indexPath as NSIndexPath).row > 2){
                height = 20
            }
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        if(nSelectedIndex == 0 && (indexPath as NSIndexPath).section == 0){
            return nil
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        cell.contentView.backgroundColor = UIColor.darkGray
        
        if(nSelectedIndex == 2 && (indexPath as NSIndexPath).row == 1){
            NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFY_MSG_HISTORY), object: nil)
        }
        
        self.menuContainerViewController.toggleRightSideMenuCompletion({
            tableView.reloadData()
        })
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
