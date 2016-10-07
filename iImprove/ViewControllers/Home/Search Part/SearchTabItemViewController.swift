//
//  SearchTabItemViewController.swift
//  iImprove
//
//  Created by Prince on 12/16/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class SearchTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblSearch: UITableView!
    // MARK: - Variables
    var itemIndex: Int = 0
    let itemTitles = ["Teachers", "Parents", "Students", "Companies"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblSearch.dataSource = self
        self.tblSearch.delegate = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_USER_SEARCH, for: indexPath)
        let lblName = cell.contentView.viewWithTag(2) as! UILabel
        let lblTitle = cell.contentView.viewWithTag(3) as! UILabel
        
        lblName.text = "Michale Jackson\(itemIndex)"
        lblTitle.text = "History \(itemTitles[itemIndex]) at sylva learning"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }

}
