//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Dinu Kumarasiri on 6/9/16.
//  Copyright © 2016 Dinu Kumarasiri. All rights reserved.
//

import UIKit

class PlaySoundViewController: UIViewController {
    
    var recordedAudioURL:NSURL!

    @IBOutlet weak var dathvaderButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
