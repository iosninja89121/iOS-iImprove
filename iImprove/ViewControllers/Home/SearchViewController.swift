//
//  SearchViewController.swift
//  iImprove
//
//  Created by Prince on 12/16/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit
import PagingMenuController

class SearchViewController: UIViewController, UISearchBarDelegate, PagingMenuControllerDelegate {
    @IBOutlet weak var searchBar: UISearchBar!

    @IBAction func onBack(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true);
    }
    
    @IBAction func onSetting(_ sender: AnyObject) {
        let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_SEARCH_SETTING))!
        self.navigationController?.pushViewController(ctrlVC, animated:true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initPageMenuController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPageMenuController(){
        let vcTeachers = storyboard!.instantiateViewController(withIdentifier: VC_SEARCH_TAB_ITEM) as! SearchTabItemViewController
        let vcParents = storyboard!.instantiateViewController(withIdentifier: VC_SEARCH_TAB_ITEM)as! SearchTabItemViewController
        let vcStudents = storyboard!.instantiateViewController(withIdentifier: VC_SEARCH_TAB_ITEM)as! SearchTabItemViewController
        let vcCompanies = storyboard!.instantiateViewController(withIdentifier: VC_SEARCH_TAB_ITEM) as! SearchTabItemViewController
        
        vcTeachers.title = "Teachers"
        vcParents.title = "Parents"
        vcStudents.title = "Students"
        vcCompanies.title = "Companies"
        
        vcTeachers.itemIndex = 0;
        vcParents.itemIndex = 1;
        vcStudents.itemIndex = 2;
        vcCompanies.itemIndex = 3;
        
        let viewControllers = [vcTeachers, vcParents, vcStudents, vcCompanies]
        
        let options = PagingMenuOptions()
        options.selectedFont = UIFont.systemFont(ofSize: 12)
        options.font = UIFont.systemFont(ofSize: 12)
        options.backgroundColor = UIColor.black
        options.selectedBackgroundColor = UIColor.black
        options.textColor = UIColor.white
        options.selectedTextColor = UIColor.white
        options.menuHeight = 30
        options.menuPosition = .top
        options.menuDisplayMode = .segmentedControl
        options.menuItemMode = .underline(height: 3, color: UIColor(red: 31.0/255.0, green: 145.0/255.0, blue: 207.0/255.0, alpha: 1.0), horizontalPadding: 10, verticalPadding: 0)
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
    }

    // MARK: - PagingMenuControllerDelegate
    func willMoveToMenuPage(_ page: Int) {
    }
    
    func didMoveToMenuPage(_ page: Int) {
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
