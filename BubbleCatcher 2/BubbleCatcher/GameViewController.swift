//
//  GameViewController.swift
//  BubbleCatcher
//
//  Created by Kummari,Srinivas on 3/26/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation
import QuartzCore


class GameViewController: UIViewController {
    //let beepSoundURL =  NSBundle.mainBundle().URLForResource("DrumRoll", withExtension: "aif")!
    var audioFile=NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BubbleClick1", ofType: "mp3")!)
    var backgroundFile=NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Classical", ofType: "mp3")!)
    var backPlayer=AVAudioPlayer()
    var audioPlayer=AVAudioPlayer()
    var managedObjectContext=(UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
   let btnImg=UIImage(named: "bubble")
    let cellImg=UIImage(named: "cellIcon")
    @IBAction func pauesbutton(sender: AnyObject) {
        backPlayer.stop()
        
    }
    
   
    //timer
    var level = 1
    var seconds = 0
    var millisec = 0
    var timer1 = NSTimer()
    var timer = NSTimer()
    
    @IBOutlet weak var timerLBL: UILabel!
    
    @IBOutlet weak var levelLBL: UILabel!
    
    var randomGenVal:Int!
    var score:Int=0
    var HiScore=0
    var sound=""
    override func viewDidLoad() {
        //making navigation controller transparent
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        button1.layer.masksToBounds = true
        button1.layer.cornerRadius = 32
        
        scoreLBL.text="0"
        //for image setup
        super.viewDidLoad()
        let image1 = UIImage(named: "homee")
        let imageview = UIImageView(image: image1)
        imageview.contentMode = UIViewContentMode.ScaleAspectFill
        imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(imageview)
        println("in game view didload function")
        
        //for audio setup
        audioPlayer=AVAudioPlayer(contentsOfURL: audioFile, error: nil)
        backPlayer=AVAudioPlayer(contentsOfURL: backgroundFile, error: nil)

        var fetchRequest=NSFetchRequest(entityName: "UserData")
        var fetchResult=managedObjectContext?.executeFetchRequest(fetchRequest, error: nil) as [UserData]
        
        if fetchResult.count>0{
        for user in fetchResult{
            HiScore=Int(user.score)
            if user.backGround == "on"{
                println("in if user background val \(user.backGround)")
            backPlayer.play()
            }else{
               backPlayer.stop()
            }
            if user.tapSound == "on"{
                println(" in if user tap sound \(user.tapSound)")
            sound="on"
            }else{
               sound="off"
            }
        }
        }else{
            sound="on"
            backPlayer.play()
        }
        //seting initial bubble
        gameOnFunction()
        seconds = 5
        millisec = 100

       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        println("in seg")
        
        if(segue.identifier=="pause"){
            
            timer.invalidate()
            
            var pauseVC =  segue.destinationViewController as PauseViewController
            pauseVC.gameVC = self
        }
   }
    
    func cancelpause(){
        
    }
    @IBAction func buttonAction1(sender: UIButton) {
        
        //playMySound()
        
        //audioPlayer.play()
        var date=NSDate()
       
        if(selectionCheck(1, button: button1)){
                println("in true game over")
          callGameOverViewController()
        }
       setTimer()
    }
    
    
    @IBAction func buttonAction2(sender: UIButton) {
        //playMySound()
        //audioPlayer.play()
        
        if(selectionCheck(2, button: button2)){
            callGameOverViewController()
        }
setTimer()
    }
    @IBAction func buttonAction3(sender: UIButton) {
        //playMySound()
       
        if(selectionCheck(3, button: button3)){
            callGameOverViewController()
        }
       setTimer()

    }
    @IBAction func buttonAction4(sender: UIButton) {
        //playMySound()
        
        if(selectionCheck(4, button: button4)){
            callGameOverViewController()
        }
       setTimer()

        
    }
    @IBAction func buttonAction5(sender: UIButton) {
       // playMySound()
        
        if(selectionCheck(5, button: button5)){
            callGameOverViewController()
        }
        setTimer()

        
    }
    @IBAction func buttonAction6(sender: UIButton) {
       // playMySound()
      
        if(selectionCheck(6, button: button6)){
            callGameOverViewController()
        }
       setTimer()

    }
    @IBAction func buttonAction7(sender: UIButton) {
       // playMySound()
     
        if(selectionCheck(7, button: button7)){
            callGameOverViewController()
        }
       setTimer()

        
    }
    @IBAction func buttonAction8(sender: UIButton) {
       // playMySound()
       
        if(selectionCheck(8, button: button8)){
            callGameOverViewController()
        }
       setTimer()

    }
    @IBAction func buttonAction9(sender: UIButton) {
        //playMySound()
        var date=NSDate()
        if(selectionCheck(9, button: button9)){
            callGameOverViewController()
        }
        setTimer()

        
    }
    @IBAction func buttonAction10(sender: UIButton) {
       
        if(selectionCheck(10, button: button10)){
            callGameOverViewController()
        }
       setTimer()
        
    }
    @IBAction func buttonAction11(sender: UIButton) {
        //playMySound()
               if(selectionCheck(11, button: button11)){
            callGameOverViewController()
        }
        setTimer()
        
    }
    @IBAction func buttonAction12(sender: UIButton) {
        //playMySound()
      
        if(selectionCheck(12, button: button12)){
            callGameOverViewController()
        }
       setTimer()
    }
    @IBAction func buttonAction13(sender: UIButton) {
      
        if(selectionCheck(13, button: button13)){
            callGameOverViewController()
        }
        setTimer()
    }
    @IBAction func buttonAction14(sender: UIButton) {
        var date=NSDate()
        if(selectionCheck(14, button: button14)){
            callGameOverViewController()
        }
        setTimer()
        
    }
    @IBAction func buttonAction15(sender: UIButton) {
       
        if(selectionCheck(15, button: button15)){
            callGameOverViewController()
        }
      setTimer()
    }
    @IBAction func buttonAction16(sender: UIButton) {
      
        if(selectionCheck(16, button: button16)){
            callGameOverViewController()
        }
        setTimer()
        
    }
    @IBAction func buttonAction17(sender: UIButton) {
        
        if(selectionCheck(17, button: button17)){
            callGameOverViewController()
        }
      setTimer()
    }
    @IBAction func buttonAction18(sender: UIButton) {
       
        if(selectionCheck(18, button: button18)){
            callGameOverViewController()
        }
       setTimer()
        
    }
    @IBAction func buttonAction19(sender: UIButton) {
       
        if(selectionCheck(19, button: button19)){
            callGameOverViewController()
        }
       setTimer()
    }
    @IBAction func buttonAction20(sender: UIButton) {
      
        if(selectionCheck(20, button: button20)){
            callGameOverViewController()
        }
       setTimer()
    }
   // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //    if(segue.identifier=="gameOverSegue"){
    //        var gov=segue.destinationViewController as GameOverViewController
  //      }
//    }
    func gameOnFunction(){
        
        //self.dismissViewControllerAnimated(true, completion: nil)
        randomGenVal=randomFunction()
        println("in dis random val \(randomGenVal)")
        if(randomGenVal == 1){
            button1.setImage(btnImg, forState: .Normal)
            println("in one")
            
        }else if(randomGenVal == 2){
            button2.setImage(btnImg, forState: .Normal)
            println("in two")
           
        }else if(randomGenVal == 3){
            button3.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 4){
            button4.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 5){
            button5.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 6){
            button6.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 7){
            button7.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 8){
            button8.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 9){
            button9.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 10){
            button10.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 11){
            button11.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 12){
            button12.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 13){
            button13.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 14){
            button14.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 15){
            button15.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 16){
            button16.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 17){
            button17.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 18){
            button18.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }else if(randomGenVal == 19){
            button19.setImage(btnImg, forState: .Normal)
            println("in two")
            
        }else if(randomGenVal == 20){
            button20.setImage(btnImg, forState: UIControlState.Normal)
            println("in three")
        }
    }
    func randomFunction()->Int{
        return Int(arc4random_uniform(20) + 1)
    }
    
    func selectionCheck(currentIndex:Int,button:UIButton) ->Bool{
        if sound == "on"{
            audioPlayer.play()
        }else{
            audioPlayer.stop()
        }
        println("in select")
        println("in select button\(button)")
        println("randomGen Val \(randomGenVal) ")
        
        if(randomGenVal==currentIndex && (seconds > 0 || millisec > 0)){
            
            button.setImage(cellImg, forState: .Normal)
            score=score+1
            scoreLBL.text="\(score)"
            if(score>HiScore){
                HiScore=score
//              var userData=NSEntityDescription.insertNewObjectForEntityForName("UserData", inManagedObjectContext: managedObjectContext!) as UserData
                var fetchRequest=NSFetchRequest(entityName: "UserData")
                var fetchResult=managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as [UserData]
                if fetchResult.count>0{
                    for settings in fetchResult{
                        settings.score=HiScore
                        managedObjectContext?.save(nil)
                    }
                }
//                userData.backGround="Srinivas"
//                userData.tapSound="Sri"
//                userData.score=0
//                userData.score=HiScore
//                managedObjectContext?.save(nil)
            }
            gameOnFunction()
            return false
        }else{
            println("failed")
            backPlayer.stop()
           return true
           
            }
        
    }

    func callGameOverViewController(){
        backPlayer.stop()
        var mystory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var gov = mystory.instantiateViewControllerWithIdentifier("gameover") as GameOverViewController
        gov.gvc=self
       // println(navigationController)
        
        self.presentViewController(gov, animated: true, completion: nil)

    }
    func dismissCurrentView(){
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    override func viewDidAppear(animated: Bool) {
        setupGame()
        
        
        
    }
    
    
    
    
    //timer
    func setupGame()  {
        
        
        
        timerLBL.text = "Time: \(seconds) : \(millisec)"
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("subtractSec"), userInfo: nil, repeats: true)
        
    }
    
    func subtractSec() {
        
        millisec--
        if(millisec==0 && seconds != 0){
            seconds--
            millisec = 100
            
        }
        else{
            
        }
        if(level*5 == score){
            //timer.invalidate()
            
          
                var animation = CABasicAnimation(keyPath: "transform.scale")
                animation.toValue = NSNumber(float: 2.0)
                animation.duration = 0.3
                animation.repeatCount = 2.0
                animation.autoreverses = true
                levelLBL.layer.addAnimation(animation, forKey: nil)
            
          
            level++
           // presentViewController(alert, animated: true, completion:nil)
            
            levelLBL.text = "Level: \(level)"
            //seconds = 5-level
            
        }
        
        timerLBL.text = "Time: \(seconds) : \(millisec)"
        
        if(seconds == 0 && millisec == 0)  {
            timer.invalidate()
            
            var mystory:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var gov = mystory.instantiateViewControllerWithIdentifier("gameover") as GameOverViewController
             gov.gvc=self
            self.presentViewController(gov, animated: true, completion: nil)
        }
    }
    
    func setTimer(){
        timer.invalidate()
        if(level>=5){
        seconds = 0
        millisec = 100 - Int(level/2)
        setupGame()
        }
        else {
            timer.invalidate()
            seconds = 5-level
            millisec = 100
            setupGame()
        }
    
    }

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
