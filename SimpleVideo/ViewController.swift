//
//  ViewController.swift
//  SimpleVideo
//
//  Created by Ben on 11/22/20.
//  Copyright © 2020 Ben. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playVideo(_ sender: UIButton) {
        let streamURL = UserDefaults.standard.string(forKey:"streamUrl");
        guard let url = URL(string: "https://5a0b08c113164.streamlock.net/live/ourstmarys/ourstmarys/playlist.m3u8") else {
        return
        }
//        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else {
//        return
//        }
        
        if (AVAsset(url: url).isPlayable) {
            print("Video Is Playable")
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
    }
    
}

