//
//  FeedbackViewController.swift
//  iImprove
//
//  Created by Xian Lee on 20/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import HCSStarRatingView

class FeedbackViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tblCart: UITableView!
    var collectionFeedback: UICollectionView!
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
    
    func initCollectionViewFeedback(){
        let nItemWidth: CGFloat = collectionFeedback.frame.size.width
        let nItemHeight: CGFloat = 130
        
        let layoutFeedback: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutFeedback.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutFeedback.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutFeedback.scrollDirection = .vertical
        
        collectionFeedback.delegate = self
        collectionFeedback.dataSource = self
        collectionFeedback.collectionViewLayout = layoutFeedback
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
            
            lblTitle.text = "Feedback"
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
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_VERTICAL, for: indexPath)
            
            collectionFeedback = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionViewFeedback()
            
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
        
        var height:CGFloat = 180
        
        if((indexPath as NSIndexPath).section == 0){
            height = 280
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
        if(collectionView == collectionFeedback){
            if((indexPath as NSIndexPath).row % 2 == 0){
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
                
                let btnSubmit = cell.contentView.viewWithTag(11)! as! UIButton
                
                btnSubmit.layer.masksToBounds = true
                btnSubmit.layer.cornerRadius = 4
                
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_VERTICAL_OTHER, for: indexPath)
                
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
            }
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CL_CELL_CAT_HORIZENTAL, for: indexPath)
            
            let btnAddToCart = cell.contentView.viewWithTag(10)! as! UIButton
            
            btnAddToCart.layer.masksToBounds = true
            btnAddToCart.layer.cornerRadius = 4
            
            let btnSave = cell.contentView.viewWithTag(11)! as! UIButton
            
            btnSave.layer.masksToBounds = true
            btnSave.layer.cornerRadius = 4
            
            return cell
        }
        
        
    }
}
