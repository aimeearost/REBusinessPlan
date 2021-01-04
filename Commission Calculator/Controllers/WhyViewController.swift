//
//  WhyViewController.swift
//  Commission Calculator
//
//  Created by Aimee Arost on 1/2/21.
//

import UIKit
import RealmSwift
import youtube_ios_player_helper
import AVFoundation


class WhyViewController: UIViewController {
    
    
    @IBOutlet weak var whyVideo: YTPlayerView!
    
    
    @IBOutlet weak var myWhyInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whyVideo.load(withVideoId: "IPYeCltXpxw", playerVars: ["playsinline": "1"])

       

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
}

