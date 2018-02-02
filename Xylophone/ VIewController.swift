//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        

        let url = noteProvider(withKey: sender.tag)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else {
                return
            }
            player.prepareToPlay()
            player.play()
        }
        catch let error as Error    {
            print(error)
        }
        
    }
    
    func noteProvider(withKey keySent:Int) -> URL {
        
    let url = Bundle.main.url(forResource: "note"+"\(keySent)", withExtension: "wav")
    
    return url!
        
    }
    
  

}

