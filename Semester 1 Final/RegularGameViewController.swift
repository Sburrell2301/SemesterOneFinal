//
//  RegularGameViewController.swift
//  Semester 1 Final
//
//  Created by Sam Burrell on 12/12/16.
//  Copyright © 2016 Sam Burrell. All rights reserved.
//

import UIKit

class RegularGameViewController: UIViewController {
    @IBOutlet weak var Home: UIView!
    @IBOutlet weak var Visitor: UIView!
    @IBOutlet weak var homePlus: UILabel!
    @IBOutlet weak var homeSubtract: UILabel!
    @IBOutlet weak var visitorPlus: UILabel!
    @IBOutlet weak var visitorSubract: UILabel!
    @IBOutlet weak var visitorScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    var homeButtons = [(homeTap, TapSubtract)]()
    var visitorButtons = [(AwayTap, TapSubtract)]()
    var homeS = 0
    var visitorS = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeButtons.append((homePlus as! homeTap, homeSubtract as! TapSubtract))
        visitorButtons.append((visitorPlus! as! AwayTap, visitorSubract as! TapSubtract))
    }
    
    @IBAction func onHomeTapped(_ sender: UITapGestureRecognizer) {
        
        for label in homeButtons{
            if label.0.frame.contains(sender.location(in: homePlus)){
                if label.0.canTap == true{
                    print("It worked!")
                    homeS += 1
                    homeScore.text = "\(homeS)"
                }
            }
            else {
                if label.1.canTap == true{
                    
                    print("It subtracted")
                    homeS -= 1
                    homeScore.text = "\(homeS)"
                }
            }
        }
    }
    
    @IBAction func visitorTap(_ sender: UITapGestureRecognizer) {
        for label in visitorButtons{
            if label.0.frame.contains(sender.location(in: visitorPlus)){
                if label.0.canTap == true{
                    print("The visitor worked!")
                    visitorS += 1
                    visitorScore.text = "\(visitorS)"
                }
            }
            else {
                if label.1.canTap == true{
                    print("It subtracted the visitor")
                    visitorS -= 1
                    visitorScore.text = "\(visitorS)"
                    
                }
            }
        }
    }
}
