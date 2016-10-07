//
//  MsgHistoryViewController.swift
//  iImprove
//
//  Created by Xian Lee on 22/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class MsgHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblHistory: UITableView!

    @IBAction func onBack(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onCompose(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblHistory.delegate = self
        tblHistory.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_MSG_HISTORY, for: indexPath)
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        let vcDetail = storyboard?.instantiateViewController(withIdentifier: VC_MSG_DETAIL) as! MsgDetailViewController
        
        self.navigationController?.pushViewController(vcDetail, animated: true)
        
//        cell.contentView.backgroundColor = UIColor.darkGrayColor()
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
