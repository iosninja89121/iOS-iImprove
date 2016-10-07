//
//  SavedItemsViewController.swift
//  iImprove
//
//  Created by Xian Lee on 19/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import HCSStarRatingView

class SavedItemsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tblCart: UITableView!
    var collectionCancelledItem: UICollectionView!
    var collectionRelatedItems: UICollectionView!
    
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
    
    func initCollectionViewSavedItem(){
        let nItemWidth: CGFloat = (collectionCancelledItem.frame.size.width - 20) / 3.0
        let nItemHeight: CGFloat = 180
        
        let layoutSavedItem: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutSavedItem.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutSavedItem.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutSavedItem.scrollDirection = .horizontal
        
        collectionCancelledItem.delegate = self
        collectionCancelledItem.dataSource = self
        collectionCancelledItem.collectionViewLayout = layoutSavedItem
    }
    
    func initCollectionViewRelatedItem(){
        let nItemWidth: CGFloat = (collectionRelatedItems.frame.size.width - 20) / 3.0
        let nItemHeight: CGFloat = 180
        
        let layoutRelatedItem: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutRelatedItem.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutRelatedItem.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutRelatedItem.scrollDirection = .horizontal
        
        collectionRelatedItems.delegate = self
        collectionRelatedItems.dataSource = self
        collectionRelatedItems.collectionViewLayout = layoutRelatedItem
    }
    
    // MARK: - TableView Delegate and DataSource
    func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_GENERAL)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Saved Items"
            return headerCell
            
        case 1:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_OTHER)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Related Items"
            return headerCell
            
        default: break
            
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row){
        case (0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_HORIZENTAL, for: indexPath)
            
            collectionCancelledItem = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewSavedItem()
            
            return cell
            
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_HORIZENTAL, for: indexPath)
            
            collectionRelatedItems = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewRelatedItem()
            
            return cell
            
        default: break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        let height:CGFloat = 180
        
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        cell.contentView.backgroundColor = UIColor.darkGray
    }
    
    // MARK: - UICollectionView Delegate and DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
