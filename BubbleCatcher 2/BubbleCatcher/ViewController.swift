//
//  ViewController.swift
//  BubbleCatcher
//
//  Created by Kummari,Srinivas on 3/26/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class ViewController: UIViewController {
    
    var moc=(UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var backgroundFile=NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Classical", ofType: "mp3")!)
    var backPlayer=AVAudioPlayer()
    


    override func viewDidLoad() {
//        //self.navigationController.navigationBar.translucent = YES;
//        //self.navigationController?.navigationBar.translucent=true
        
        backPlayer=AVAudioPlayer(contentsOfURL: backgroundFile, error: nil)
        var homeSound : String = ""
        
         var fetchreq = NSFetchRequest(entityName: "UserData")
        
        var result = moc?.executeFetchRequest(fetchreq, error: nil) as [UserData]
        
        if result.count > 0{
            println("in home result 1")
            homeSound =  result[0].backGround
        }
        else{
            println("in home resultset 0")
            homeSound = "on"
            var userData=NSEntityDescription.insertNewObjectForEntityForName("UserData", inManagedObjectContext: moc!) as UserData
            userData.backGround="on"
            userData.tapSound="on"
            moc?.save(nil)
            
        }
        //checking
        if(homeSound == "on"){
            println("in home sound on")
            backPlayer.play()
        }
        else{
            println("in home sound of")
            backPlayer.stop()
        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        super.viewDidLoad()
        let image1 = UIImage(named: "homee")
        let imageview = UIImageView(image: image1)
        imageview.contentMode = UIViewContentMode.ScaleAspectFill
        imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(imageview)
       // println("in main view controller")
        // self.view.backgroundColor=UIColor(patternImage: UIImage(named: "home")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func settingButton(sender: UIButton) {
            backPlayer.stop()
        //        nextViewController *obj =[[nextViewController alloc]initWithNibName:@"nextViewController" bundle:nil];
//        [self.navigationController pushViewController:obj animated:YES];
//        [obj release];
//        
    }
    @IBAction func playButton(sender: UIButton) {
        backPlayer.stop()
       //let vc = GameViewController(nibName: "GameViewController", bundle: nil)
   //     let vc = GameViewController()
//        println(navigationController)
     //  navigationController?.pushViewController(vc, animated: true)
  //      self.presentViewController(vc, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

