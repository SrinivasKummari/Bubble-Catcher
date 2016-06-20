//
//  CustomTableViewCell.swift
//  BubbleCatcher
//
//  Created by Kummari,Srinivas on 4/21/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    //var moc=(UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    var appDel=UIApplication.sharedApplication().delegate as AppDelegate
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func switchTapped(sender: UISwitch) {
        if(mySwitch.on){
            println("in switch1")
            appDel.switchStatus="on"
        }else{
            appDel.switchStatus="off"
        }
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
