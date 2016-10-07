//
//  CartCheckoutViewController.swift
//  iImprove
//
//  Created by Xian Lee on 19/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import HCSStarRatingView

class CartCheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var tblCart: UITableView!
    var collectionShoppingCart: UICollectionView!
    var collectionSavedItems: UICollectionView!
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
    
    func initCollectionViewShoppingCart(){
        let nItemWidth: CGFloat = collectionShoppingCart.frame.size.width
        let nItemHeight: CGFloat = 127
        
        let layoutShoppingCart: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutShoppingCart.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutShoppingCart.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        
        collectionShoppingCart.delegate = self
        collectionShoppingCart.dataSource = self
        collectionShoppingCart.collectionViewLayout = layoutShoppingCart
    }
    
    func initCollectionViewSavedItem(){
        let nItemWidth: CGFloat = (collectionSavedItems.frame.size.width - 20) / 3.0
        let nItemHeight: CGFloat = 180
        
        let layoutSavedItem: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutSavedItem.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutSavedItem.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutSavedItem.scrollDirection = .horizontal
        
        collectionSavedItems.delegate = self
        collectionSavedItems.dataSource = self
        collectionSavedItems.collectionViewLayout = layoutSavedItem
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
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
            
            lblTitle.text = "Shopping Cart"
            return headerCell
            
        case 1:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_GENERAL)
            headerCell?.backgroundColor = UIColor.clear
            
            let lblTitle = headerCell?.contentView.viewWithTag(1) as! UILabel
            
            lblTitle.text = "Saved Items"
            return headerCell

        case 2:
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
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_VERTICAL, for: indexPath)
            
            collectionShoppingCart = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewShoppingCart()
            
            return cell
            
        case (0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_TOTAL_PRICE, for: indexPath)
            
            return cell
            
        case (0, 2):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CHECKOUT, for: indexPath)
            let button = cell.contentView.viewWithTag(2)
            
            button?.layer.masksToBounds = true
            button?.layer.cornerRadius = 4
            
            return cell
            
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_HORIZENTAL, for: indexPath)
            
            collectionSavedItems = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewSavedItem()
            
            return cell
            
        case (2, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_HORIZENTAL, for: indexPath)
            
            collectionRelatedItems = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewRelatedItem()
            
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
        case (0, 1):
            height = 30
            
        case (0, 2):
            height = 30
            
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
        if(collectionView == collectionShoppingCart){
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
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_HORIZENTAL, for: indexPath)
            
            return cell
        }
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
