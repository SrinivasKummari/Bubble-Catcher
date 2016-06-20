//
//  GameOverViewController.swift
//  BubbleCatcher
//
//  Created by Kummari,Srinivas on 4/13/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class GameOverViewController: UIViewController {
    var gvc:GameViewController!
    var gameOverFile=NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gameOver", ofType: "mp3")!)
    var moc=(UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var gameOverPlayer=AVAudioPlayer()
    @IBOutlet weak var hiScoreLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var gameOverLBL: UILabel!
    override func viewDidLoad() {
        gameOverPlayer=AVAudioPlayer(contentsOfURL: gameOverFile, error: nil)
        super.viewDidLoad()
        hiScoreLBL.text="\(gvc.HiScore)"
        scoreLBL.text="\(gvc.score)"
        println("in didload")
        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=moc?.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        if(fetchResult.count>0){
            for result in fetchResult{
                if result.backGround=="on"{
                    gameOverPlayer.play()
                }
            }
        }
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: nil, animations: {
            self.gameOverLBL.center =  CGPoint(x: 200, y: 40+200)
        }, completion: nil)
       
        //        let image1 = UIImage(named: "homee")
//        let imageview = UIImageView(image: image1)
//        imageview.contentMode = UIViewContentMode.ScaleAspectFill
//        imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
//        self.view.addSubview(imageview)
     //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "homee")!)
        //self.view.backgroundColor = UIColor.greenColor()
//        var label = UILabel(frame: CGRectMake(0, 0, 200, 30))
//        label.center = CGPointMake(160, 150)
//        label.textAlignment = NSTextAlignment.Center
//        label.backgroundColor=UIColor.grayColor()
//        label.layer.cornerRadius=20
//        //label.
//        label.text = "Game Over"
//        self.view.addSubview(label)
//        
//        var hiScoreLBL = UILabel(frame: CGRectMake(0, 0, 200, 30))
//        hiScoreLBL.center = CGPointMake(160, 190)
//        hiScoreLBL.textAlignment = NSTextAlignment.Left
//        hiScoreLBL.backgroundColor=UIColor.grayColor()
//        hiScoreLBL.layer.cornerRadius=20
//        //label.
//        hiScoreLBL.text = "Hi Score  :"
//        self.view.addSubview(hiScoreLBL)
//        var hiScore = UILabel(frame: CGRectMake(0, 0, 50, 30))
//        hiScore.center = CGPointMake(200, 190)
//        hiScore.textAlignment = NSTextAlignment.Center
//        hiScore.backgroundColor=UIColor.grayColor()
//        hiScore.layer.cornerRadius=20
//        //label.
//        hiScore.text = "\(gvc.HiScore)"
//        self.view.addSubview(hiScore)
//        
//        var scoreLBL = UILabel(frame: CGRectMake(0, 0, 200, 30))
//        scoreLBL.center = CGPointMake(160, 240)
//        scoreLBL.textAlignment = NSTextAlignment.Left
//        scoreLBL.backgroundColor=UIColor.grayColor()
//        scoreLBL.layer.cornerRadius=20
//        //label.
//        scoreLBL.text = "Score     :"
//        self.view.addSubview(scoreLBL)
//        var score = UILabel(frame: CGRectMake(0, 0, 50, 30))
//        score.center = CGPointMake(200, 240)
//        score.textAlignment = NSTextAlignment.Center
//        score.backgroundColor=UIColor.grayColor()
//        score.layer.cornerRadius=20
//        //label.
//        score.text = "\(gvc.score)"
//        self.view.addSubview(score)
//        
//        
        
        
        //gameOverLBL.text="Game Over"
        
        //  self.view.backgroundColor=UIColor(patternImage: UIImage(named: "home")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
//
//    @IBAction func homeButton(sender: UIButton) {
//        let mvc=ViewController()
//        navigationController?.pushViewController(mvc, animated: true)
//    }
//    @IBAction func replayFunction(sender: UIButton) {
//        let gvc=GameViewController()
//        navigationController?.pushViewController(gvc, animated: true)
//    }
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.greenColor()
//       
        let image1 = UIImage(named: "homee")
                let imageview = UIImageView(image: image1)
                imageview.contentMode = UIViewContentMode.ScaleAspectFill
                imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
       var image = imageview.image
      // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "homee")!)
       
               self.view.addSubview(imageview)
        println("load view")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeAction(sender: UIButton) {
        var mystory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = mystory.instantiateViewControllerWithIdentifier("mainView") as ViewController
        self.presentViewController(vc, animated: true, completion: nil)
        gameOverPlayer.stop()
    }

    @IBAction func restartGameFunction(sender: UIButton) {
        var myBoard:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        var gvc=myBoard.instantiateViewControllerWithIdentifier("gameview") as GameViewController
        self.presentViewController(gvc, animated: true, completion: nil)
        gameOverPlayer.stop()
        
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
