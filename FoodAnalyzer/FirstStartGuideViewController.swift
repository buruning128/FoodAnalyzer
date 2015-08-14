//
//  FirstStartGuideViewController.swift
//  FoodAnalyzer
//
//  Created by ranhui on 15/8/14.
//  Copyright (c) 2015年 ranhui.test. All rights reserved.
//

import UIKit


class FirstStartGuideViewController: UIViewController,UIScrollViewDelegate {
    var scrollView:UIScrollView!
    var pageControl:UIPageControl!
    var startBtn:UIButton!
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadCustomLayout()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //scrollview委托
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset=scrollView.contentOffset

        
        pageControl.currentPage=Int(offset.x/screenSize.width)
        if(pageControl.currentPage==2){
            startBtn.hidden=false
        }else{
            startBtn.hidden=true
        }
    }
    
    //载入自定义布局
    func loadCustomLayout(){
        scrollView=UIScrollView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height))
        scrollView.pagingEnabled=true
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.showsVerticalScrollIndicator=false
        scrollView.contentSize=CGSizeMake(3*screenSize.width, screenSize.height)
        for i in 1...4{
            var image=UIImage(named: "tutorial_background_0\(i)@2x.jpg")
            var imageView=UIImageView(image: image)
            imageView.frame=CGRectMake(CGFloat((i-1))*screenSize.width, 0, screenSize.width, screenSize.height)
            imageView.contentMode = UIViewContentMode.ScaleToFill
            scrollView.addSubview(imageView)
            
        }
        pageControl=UIPageControl(frame: CGRectMake(screenSize.width/2-100, screenSize.height-100, 200, 100))
        startBtn=UIButton(frame: CGRectMake(screenSize.width/2-60, screenSize.height/2+50, 120, 35))
        
        pageControl.numberOfPages=3;
        pageControl.currentPage=0
        
        startBtn.setTitle("马上体验", forState: UIControlState.Normal)
        startBtn.setBackgroundImage(UIImage(named: "StartButton"), forState: UIControlState.Normal)
        startBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        startBtn.addTarget(self, action: "guideOver", forControlEvents: UIControlEvents.TouchUpInside)
        startBtn.hidden=true
        
        
        scrollView.bounces=false
        scrollView.delegate=self
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        self.view.addSubview(startBtn)
        
    }
    
    //开始使用app
    func guideOver(){
        var mainVC=UINavigationController(rootViewController: UITableViewController())
        self.presentViewController(mainVC, animated: true, completion: nil)
        
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}
