//
//  ViewController.swift
//  Hello_World
//
//  Created by Project Exploration on 4/15/19.

//  Copyright © 2019 Project Exploration. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {

    var songPlayer = AVAudioPlayer()
    //15 -
   var hasBeenPaused = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //13
        prepareSongAndSession()
        
        
    }
    
    //6 -
    func prepareSongAndSession() {
        
        do {
        //7 - Insert the song from our Bundle into our AVAudioPlayer
            let songURL = URL.init(fileURLWithPath: Bundle.main.path(forResource: "Meek Mill - Dangerous (feat. Jeremih & PnB Rock)", ofType: "mp3")!)
            
            songPlayer = try AVAudioPlayer(contentsOf: songURL)
            
            //8 - Prepare the song to be played
            songPlayer.prepareToPlay()
            
            //9 - Create an audio session
            let audioSession = AVAudioSession.sharedInstance()
            do {
                //10 - Set our session category to playback music
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        } catch let sessionError {
            print(sessionError)
        }

        } catch let songPlayerError {
            print(songPlayerError)
        }
}

    
    
    @IBAction func pause(_ sender: Any) {
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
        }
    }
    @IBAction func play(_ sender: Any) {
        //14
        songPlayer.play()
        print("Click")
        
    }


    @IBAction func restart(_ sender: Any) {
        //17 -
        if songPlayer.isPlaying || hasBeenPaused {
            songPlayer.stop()
            songPlayer.currentTime  = 0
            
            
        } else {
            songPlayer.play()
        }
    }
}

