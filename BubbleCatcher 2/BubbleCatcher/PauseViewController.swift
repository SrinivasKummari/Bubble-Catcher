//
//  PauseViewController.swift
//  BubbleCatcher
//
//  Created by Pannala,Rajasekhar Reddy on 4/21/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData

class PauseViewController: UIViewController {
    var moc=(UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var gameVC : GameViewController!
 var backGround=NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Classical", ofType: "mp3")!)
var backPlayer=AVAudioPlayer()
    @IBAction func restartAction(sender: AnyObject) {
        gameVC.seconds = 5
        gameVC.millisec = 100
        gameVC.score = 0
        gameVC.level = 1
        self.dismissViewControllerAnimated(true, completion: nil)
        backPlayer.stop()
    }

    @IBAction func homeAction(sender: AnyObject) {
        var mystory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = mystory.instantiateViewControllerWithIdentifier("mainView") as ViewController
        self.presentViewController(vc, animated: true, completion: nil)
        backPlayer.stop()
    }
   
    @IBAction func resumeAction(sender: AnyObject) {
        
     self.dismissViewControllerAnimated(true, completion: nil)
        backPlayer.stop()
    }
    override func viewDidLoad() {
        backPlayer=AVAudioPlayer(contentsOfURL: backGround, error: nil)
        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=moc?.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        if(fetchResult.count>0){
            for result in fetchResult{
                if(result.backGround == "on"){
                    backPlayer.play()
                }
                
            }
        }
        
        super.viewDidLoad()
        let image1 = UIImage(named: "homee")
        let imageview = UIImageView(image: image1)
        imageview.contentMode = UIViewContentMode.ScaleAspectFill
        imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(imageview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
