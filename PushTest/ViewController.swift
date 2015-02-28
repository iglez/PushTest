//
//  ViewController.swift
//  PushTest
//
//  Created by ivan gonzalez on 2/24/15.
//  Copyright (c) 2015 evolve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var notificationLabel: UILabel!
    var theLabel = "Waiting for notification..."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationLabel.text = theLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refresh(text: NSString){
        notificationLabel.text = text
    }

}

