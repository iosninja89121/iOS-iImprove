//
//  SellersFollowViewController.swift
//  iImprove
//
//  Created by Xian Lee on 19/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import HCSStarRatingView

class SellersFollowViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tblCart: UITableView!
    var collectionPurchasedHistory: UICollectionView!
    var collectionCancelledItem: UICollectionView!
    
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
    
    func initCollectionViewShoppingCart(){
        let nItemWidth: CGFloat = collectionPurchasedHistory.frame.size.width
        let nItemHeight: CGFloat = 127
        
        let layoutShoppingCart: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutShoppingCart.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutShoppingCart.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        
        collectionPurchasedHistory.delegate = self
        collectionPurchasedHistory.dataSource = self
        collectionPurchasedHistory.collectionViewLayout = layoutShoppingCart
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
            
            lblTitle.text = "Sellers You Follow"
            return headerCell
            
        case 1:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_GENERAL)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Featured Sellers"
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
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_VERTICAL, for: indexPath)
            
            collectionPurchasedHistory = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewShoppingCart()
            
            return cell
            
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_HORIZENTAL, for: indexPath)
            
            collectionCancelledItem = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewSavedItem()
            
            return cell
            
        default: break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        var height:CGFloat = 44
        
        switch((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row){
        case (0, 0):
            height = 260
            
        case (1, 0):
            height = 180
            
        case (2, 0):
            height = 180
            
        default: break
        }
        
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
        if(collectionView == collectionPurchasedHistory){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_VERTICAL, for: indexPath)
            let view = cell.contentView.viewWithTag(10)! as UIView
            let viewRating = HCSStarRatingView(frame: CGRect(x: 0, y: 0, width: 70, height: 12))
            
            viewRating.maximumValue = 5
            viewRating.minimumValue = 0
            viewRating.value = 4.0
            viewRating.tintColor = UIColor.yellow
            
            viewRating.backgroundColor = UIColor.white
            
            viewRating.isUserInteractionEnabled = false
            
            view.addSubview(viewRating)
            view.backgroundColor = UIColor.white
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_HORIZENTAL, for: indexPath)
            
            let view = cell.contentView.viewWithTag(10)! as UIView
            let viewRating = HCSStarRatingView(frame: CGRect(x: 0, y: 0, width: 70, height: 12))
            
            viewRating.maximumValue = 5
            viewRating.minimumValue = 0
            viewRating.value = 4.0
            viewRating.tintColor = UIColor.yellow
            
            viewRating.backgroundColor = UIColor.white
            
            viewRating.isUserInteractionEnabled = false
            
            view.addSubview(viewRating)
            view.backgroundColor = UIColor.white
            
            return cell
        }
    }


}
