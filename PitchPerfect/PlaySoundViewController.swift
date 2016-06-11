//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Dinu Kumarasiri on 6/9/16.
//  Copyright © 2016 Dinu Kumarasiri. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundViewController: UIViewController {
    
    var recordedAudioURL:NSURL!

    @IBOutlet weak var dathvaderButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer : NSTimer!
    
    enum ButtonType: Int {case Vader=0, Chipmunk, Slow, Fast, Echo, Reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func playSoundForButton(Sender:UIButton ) {
        print ("Play Sound Button Pressed")
        switch (ButtonType (rawValue: Sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch:1000)
        case .Vader:
            playSound(pitch:-1000)
        case .Echo:
            playSound(echo:true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(Sender:UIButton) {
        print ("Stop Button Pressed")
        stopAudio()
    }

}
