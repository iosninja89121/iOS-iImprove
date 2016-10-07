//
//  RatingViewController.swift
//  iImprove
//
//  Created by Xian Lee on 21/12/2015.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import HCSStarRatingView

class RatingViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tblCart: UITableView!
    var collectionRating: UICollectionView!
    var collectionPeople: UICollectionView!
    
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
    
    func initCollectionRating(){
        let nItemWidth: CGFloat = collectionRating.frame.size.width
        let nItemHeight: CGFloat = 127
        
        let layoutRating: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutRating.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutRating.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        
        collectionRating.delegate = self
        collectionRating.dataSource = self
        collectionRating.collectionViewLayout = layoutRating
    }
    
    func initCollectionPeople(){
        let nItemWidth: CGFloat = (collectionPeople.frame.size.width - 20) / 3.0
        let nItemHeight: CGFloat = 180
        
        let layoutPeople: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutPeople.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutPeople.itemSize = CGSize(width: nItemWidth, height: nItemHeight)
        layoutPeople.scrollDirection = .horizontal
        
        collectionPeople.delegate = self
        collectionPeople.dataSource = self
        collectionPeople.collectionViewLayout = layoutPeople
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
    
            return headerCell
            
        case 1:
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_CATEGORY_TITLE_OTHER)
        
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
            
            collectionRating = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionRating()
            
            return cell
            
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: TBL_CELL_COLLECTION_HORIZENTAL, for: indexPath)
            
            collectionPeople = cell.contentView.viewWithTag(1) as! UICollectionView
            initCollectionPeople()
            
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
        if(collectionView == collectionRating){
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
