//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Dinu Kumarasiri on 6/5/16.
//  Copyright © 2016 Dinu Kumarasiri. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate{

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    
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

        //setting a path to store the recorder audio
        let dirpath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirpath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print (filePath)
        
        // get the audio recording instance
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // recording
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }

    @IBAction func stopRecording(sender: AnyObject) {
        print("stop recording button pressed")
        stopRecordingButton.enabled = false
        recordButton.enabled = true
        recordingLabel.text = "Tap to Record"
        
        //stop recording
        audioRecorder.stop()
        let audioSession =  AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func viewWillAppear(animated: Bool) {
        print ("View will appear called")
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudio recorder is finished saving the recording")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
            
        } else {
            print("saving of recording failed")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundVC = segue.destinationViewController as! PlaySoundViewController
            let recordedURL = sender as! NSURL
            playSoundVC.recordedAudioURL = recordedURL
            
        }
    }
    
    
    
}

