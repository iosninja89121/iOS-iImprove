//
//  SellHistoryViewController.swift
//  iImprove
//
//  Created by Xian Lee on 20/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class SellHistoryViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tblCart: UITableView!
    var collectionActive: UICollectionView!
    var collectionSold: UICollectionView!
    var collectionReturned: UICollectionView!
    
    @IBAction func onBack(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func onUser(_ sender: AnyObject) {
        self.menuContainerViewController.toggleRightSideMenuCompletion(nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblCart.delegate = self
        self.tblCart.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCollectionActive(){
        let nItemWidth: CGFloat = collectionActive.frame.size.width
        let nItemHeight: CGFloat = 120
        
        let layoutActive: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutActive.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutActive.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutActive.scrollDirection = .vertical
        
        collectionActive.delegate = self
        collectionActive.dataSource = self
        collectionActive.collectionViewLayout = layoutActive
    }
    
    func initCollectionSold(){
        let nItemWidth: CGFloat = collectionSold.frame.size.width
        let nItemHeight: CGFloat = 120
        
        let layoutSold: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutSold.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutSold.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutSold.scrollDirection = .vertical
        
        collectionSold.delegate = self
        collectionSold.dataSource = self
        collectionSold.collectionViewLayout = layoutSold
    }
    
    func initCollectionReturned(){
        let nItemWidth: CGFloat = collectionReturned.frame.size.width
        let nItemHeight: CGFloat = 220
        
        let layoutReturned: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutReturned.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutReturned.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutReturned.scrollDirection = .vertical
        
        collectionReturned.delegate = self
        collectionReturned.dataSource = self
        collectionReturned.collectionViewLayout = layoutReturned
    }
    
    // MARK: - TableView Delegate and DataSource
    func numberOfSections(in tableView: UITableView) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_GENERAL)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Active Items(1)"
            return headerCell
            
        case 1:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_OTHER)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Sold Items(1)"
            return headerCell
            
        default:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_OTHER)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Returned Items"
            return headerCell

            
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_VERTICAL, for: indexPath)
        
        switch ((indexPath as NSIndexPath).section){
        case 0:
            collectionActive = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionActive()
            break
        case 1:
            collectionSold = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionSold()
            break
        default:
            collectionReturned = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionReturned()
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        var height:CGFloat = 180
        
        switch ((indexPath as NSIndexPath).section){
        case 0:
            height = 120
            break
        case 1:
            height = 120
            break
        default:
            height = 220
            break
        }
        
        return height
    }
    
    // MARK: - UICollectionView Delegate and DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == collectionActive){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_VERTICAL, for: indexPath)
            
            return cell
        } else if(collectionView == collectionSold){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_VERTICAL_OTHER, for: indexPath)
            
            return cell
            
        } else if(collectionView == collectionReturned){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_VERTICAL_RETURNED, for: indexPath)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_HORIZENTAL, for: indexPath)
        
        return cell
        
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
