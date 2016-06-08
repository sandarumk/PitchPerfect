//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Dinu Kumarasiri on 6/5/16.
//  Copyright © 2016 Dinu Kumarasiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.enabled = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        print("record Button Pressed")
        recordingLabel.text="Recording in progress"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("stop recording button pressed")
        stopRecordingButton.enabled = false
        recordButton.enabled = true
        recordingLabel.text = "Tap to Record"
    }
    
    override func viewWillAppear(animated: Bool) {
        print ("View will appear called")
    }
    
    
    
}

