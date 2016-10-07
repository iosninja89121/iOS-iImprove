//
//  WalkthroughViewController.swift
//  iImprove
//
//  Created by Prince on 12/14/15.
//  Copyright © 2015 zhs. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, UIPageViewControllerDataSource {
    // MARK: - Variables
    fileprivate var pageViewController: UIPageViewController?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateControllersArray()
        createPageViewController()
        setupPageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var controllers = [SamplePageViewController]()
    
    
    func populateControllersArray() {
        for i in 1...4{
            let controller = storyboard?.instantiateViewController(withIdentifier: VC_SAMPLE_PAGE) as! SamplePageViewController
            
            controller.itemIndex = i
            controllers.append(controller)
        }
        
//        let controller1 = storyboard!.instantiateViewControllerWithIdentifier(VC_SUB_WALK_THROUGH_1) as! PageItemViewController
//        let controller2 = storyboard!.instantiateViewControllerWithIdentifier(VC_SUB_WALK_THROUGH_2)as! PageItemViewController
//        
//        controller1.itemIndex = 0;
//        controller2.itemIndex = 1;
//        
//        controllers.append(controller1)
//        controllers.append(controller2)
    }
    
    fileprivate func createPageViewController() {
        
        let pageController = storyboard!.instantiateViewController(withIdentifier: VC_PAGE) as! UIPageViewController
        pageController.dataSource = self
        
        if !controllers.isEmpty {
            pageController.setViewControllers([controllers[0]], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    }
    
    fileprivate func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.darkGray
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let controller = viewController as? SamplePageViewController {
            if controller.itemIndex > 1 {
                return controllers[controller.itemIndex - 2]
            }
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let controller = viewController as? SamplePageViewController {
            if controller.itemIndex < controllers.count {
                return controllers[controller.itemIndex]
            }else{
                let ctrlVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: VC_BUILD_PROFILE))!
                self.navigationController?.pushViewController(ctrlVC, animated:true)
            }
        }
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
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
