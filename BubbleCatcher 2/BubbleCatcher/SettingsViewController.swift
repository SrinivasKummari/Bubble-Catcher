//
//  SettingsViewController.swift
//  BubbleCatcher
//
//  Created by Pannala,Rajasekhar Reddy on 4/19/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class SettingsViewController: UIViewController {
    
     var moc=(UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var backgroundFile=NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Classical", ofType: "mp3")!)
    var backPlayer=AVAudioPlayer()

    @IBOutlet weak var soundswitch: UISwitch!
    
    @IBOutlet weak var borderlabel1: UILabel!
    @IBOutlet weak var borderlabel: UILabel!
    @IBOutlet weak var musicSwitch: UISwitch!
    var musicStatus="on"
    var soundStatus="on"
    override func viewDidLoad() {
        backPlayer=AVAudioPlayer(contentsOfURL: backgroundFile, error: nil)
        super.viewDidLoad()
        let image1 = UIImage(named: "homee")
        let imageview = UIImageView(image: image1)
        imageview.contentMode = UIViewContentMode.ScaleAspectFill
        imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(imageview)
        // Do any additional setup after loading the view.
        borderlabel.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.5)
        borderlabel.layer.borderWidth=5
        borderlabel.layer.borderColor = UIColor.grayColor().CGColor
        borderlabel.layer.cornerRadius = 10
        borderlabel1.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.5)
        borderlabel1.layer.borderWidth=5
        borderlabel1.layer.borderColor = UIColor.grayColor().CGColor
        borderlabel1.layer.cornerRadius = 10
        
        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=moc?.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        if fetchResult.count>0{
            for settings in fetchResult{
                var backGroundSound=settings.backGround
                if backGroundSound=="on"{
                    backPlayer.play()
                }else{
                    backPlayer.stop()
                }
            }
        }
    }
    
    
    @IBAction func soundAction(sender: AnyObject) {
       // println("in sound switch1")
        
        
        if(soundswitch.on){
           // println("in sound on switch1")
            soundStatus="on"
        }else{
            soundStatus="off"
        }
        
        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=moc!.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        if(fetchResult.count>0){
            for user in fetchResult{
                user.tapSound=soundStatus
                moc?.save(nil)
            }
        }
        
    }
    
    @IBAction func musicAction(sender: AnyObject) {
        println("in music")
        if(musicSwitch.on){
           // println("in music on switch1")
            musicStatus="on"
            backPlayer.play()
        }else{
            musicStatus="off"
            backPlayer.stop()
        }
        
        
        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=moc!.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        
        if(fetchResult.count>0){
            for user in fetchResult{
                user.backGround=musicStatus
                moc?.save(nil)
            }
        }
    }
    override func viewWillAppear(animated: Bool) {
       
        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=moc!.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        if(fetchResult.count>0){
            for user in fetchResult{
                println("in resultset")
                if(user.tapSound=="on"){
                    println("tap sound on")
                    soundswitch.setOn(true, animated: true)
                    
                }else{
                    println("sound off")
                    soundswitch.setOn(false, animated: true)
                    
                }
                if user.backGround=="on"{
                    println("in background on")
                musicSwitch.setOn(true, animated: true)
                }else{
                    println("in background on")
                    musicSwitch.setOn(false, animated: true)
                }
            }
        }else{
            println("result is 0")
            soundswitch.setOn(true, animated: true)
            musicSwitch.setOn(true, animated: true)
        }
    }
    @IBAction func backToHomeButton(sender: AnyObject) {
        var myStoryBoard=UIStoryboard(name: "Main", bundle: nil)
        var vc=myStoryBoard.instantiateViewControllerWithIdentifier("mainView") as ViewController
       
        self.presentViewController(vc, animated: true, completion: nil)
        backPlayer.stop()
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
