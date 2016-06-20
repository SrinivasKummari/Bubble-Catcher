//
//  UserData.swift
//  BubbleCatcher
//
//  Created by Pannala,Rajasekhar Reddy on 4/16/15.
//  Copyright (c) 2015 Student. All rights reserved.
//

import Foundation
import CoreData

class UserData: NSManagedObject {

    @NSManaged var backGround: String
    @NSManaged var tapSound: String
    @NSManaged var score: NSNumber

}
