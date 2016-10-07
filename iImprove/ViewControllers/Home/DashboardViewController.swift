//
//  DashboardViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import PagingMenuController
import MFSideMenu

class DashboardViewController: UIViewController, PagingMenuControllerDelegate, UISearchBarDelegate {
    @IBOutlet weak var btnLeftMenu: MIBadgeButton!
    @IBOutlet weak var btnRightMenu: MIBadgeButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func onLeftMenu(_ sender: AnyObject) {
        self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
    }
    
    @IBAction func onRightmenu(_ sender: AnyObject) {
        self.menuContainerViewController.toggleRightSideMenuCompletion(nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initPageMenuController()
        initBadgeButton()
        searchBar.delegate = self
        
//        UISearchBar.appearance().setSearchFieldBackgroundImage(UIImage(named: "bg_sidebar"), forState:.Normal);
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onCheckout), name: NSNotification.Name(rawValue: NOTIFY_CHECKOUT), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onPurchasedHistory), name: NSNotification.Name(rawValue: NOTIFY_PURCHASED_HISTORY), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onSavedItems), name: NSNotification.Name(rawValue: NOTIFY_SAVED_ITEMS), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onSellersFollow), name: NSNotification.Name(rawValue: NOTIFY_SELLERS_FOLLOW), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onFeedback), name: NSNotification.Name(rawValue: NOTIFY_FEEDBACK), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onSellHistory), name: NSNotification.Name(rawValue: NOTIFY_SELL_HISTORY), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onSellItem), name: NSNotification.Name(rawValue: NOTIFY_SELL_ITEM), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onRating), name: NSNotification.Name(rawValue: NOTIFY_RATING), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onSold), name: NSNotification.Name(rawValue: NOTIFY_SOLD), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(DashboardViewController.onMsgHistory), name: NSNotification.Name(rawValue: NOTIFY_MSG_HISTORY), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func onCheckout(){
        let vcCartCheckout = storyboard?.instantiateViewController(withIdentifier: VC_CART_CHECKOUT) as! CartCheckoutViewController
        let arrVC = [self, vcCartCheckout]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onPurchasedHistory(){
        let vcPurchasedHistory = storyboard?.instantiateViewController(withIdentifier: VC_PURCHASED_HISTORY) as! PurchasedHistoryViewController
        let arrVC = [self, vcPurchasedHistory]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onSavedItems(){
        let vcSavedItems = storyboard?.instantiateViewController(withIdentifier: VC_SAVED_ITEMS) as! SavedItemsViewController
        let arrVC = [self, vcSavedItems]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onSellersFollow(){
        let vcCartCheckout = storyboard?.instantiateViewController(withIdentifier: VC_SELLERS_FOLLOW) as! SellersFollowViewController
        let arrVC = [self, vcCartCheckout]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onFeedback(){
        let vcFeedback = storyboard?.instantiateViewController(withIdentifier: VC_FEEDBACK) as! FeedbackViewController
        let arrVC = [self, vcFeedback]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onSellHistory(){
        let vcSellHistory = storyboard?.instantiateViewController(withIdentifier: VC_SELL_HISTORY) as! SellHistoryViewController
        let arrVC = [self, vcSellHistory]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onSellItem(){
        let vcSellItem = storyboard?.instantiateViewController(withIdentifier: VC_SELL_ITEM) as! SellItemViewController
        let arrVC = [self, vcSellItem]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onRating(){
        let vcRating = storyboard?.instantiateViewController(withIdentifier: VC_RATING) as! RatingViewController
        let arrVC = [self, vcRating]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onSold(){
        let vcSold = storyboard?.instantiateViewController(withIdentifier: VC_SOLD) as! SoldViewController
        let arrVC = [self, vcSold]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func onMsgHistory(){
        let vcMsgHistory = storyboard?.instantiateViewController(withIdentifier: VC_MSG_HISTORY) as! MsgHistoryViewController
        let arrVC = [self, vcMsgHistory]
        
        self.navigationController?.setViewControllers(arrVC, animated: true)
    }
    
    func initBadgeButton(){
        btnLeftMenu.badgeBackgroundColor = UIColor.clear
        btnRightMenu.badgeBackgroundColor = UIColor.clear
    }
    
    func initPageMenuController(){
        let statusViewController = storyboard!.instantiateViewController(withIdentifier: VC_STATUS)
        let photoViewController = storyboard!.instantiateViewController(withIdentifier: VC_PHOTO)
        let checkinViewController = storyboard!.instantiateViewController(withIdentifier: VC_CHECKIN)
        
        statusViewController.title = "Status"
        photoViewController.title = "Photo"
        checkinViewController.title = "Check in"
        
        let viewControllers = [statusViewController, photoViewController, checkinViewController]
        
        let options = PagingMenuOptions()
        options.selectedFont = UIFont.systemFont(ofSize: 14)
        options.font = UIFont.systemFont(ofSize: 13)
        options.menuHeight = 30
        options.menuPosition = .top
        options.menuDisplayMode = .segmentedControl
        options.menuItemMode = .underline(height: 3, color: UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func unfocusSearchBar(){
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
        
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_SEARCH))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - SearchBar Delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.perform(#selector(DashboardViewController.unfocusSearchBar), with: nil, afterDelay: 0.1)
    }
    
    // MARK: - PagingMenuControllerDelegate
    func willMoveToMenuPage(_ page: Int) {
    }
    
    func didMoveToMenuPage(_ page: Int) {
    }

}
