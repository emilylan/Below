//
//  Audio.swift
//  Below
//
//  Created by Emily Nguyen on 4/23/17.
//  Copyright © 2017 Emily Nguyen. All rights reserved.
//

import Foundation
import AVFoundation



extension Story {
    var music: String {
        switch self {
        case .start, .hello, .cont, .ignore, .here, .who, .whatHappened, .whatsHappened, .move, .breathing, .panicked, .basics, .later, .cont1, .cont2, .stole, .backToCap, .capOrDoc, .aLName, .sName, .airLock, .samples, .sub, .careful, .trench, .illegal, .condition, .getOut, .keepInSuit, .incision, .cont5, .yeahRight : return "NothingMuch.wav"
        case .smell, .look, .getOff, .distance, .luck, .medical, .cont3, .anti, .bottles, .directions, .inject, .cont4, .killed, .minute, .somethingElse  : return "faster.wav"
        }
    }
    
    var musicURL: URL {
        let fileName = music
        let url = Bundle.main.url(forResource: fileName, withExtension: nil)!
        return url
    }
}


class backgroundMusicPlayer: NSObject {
    var bgPlayer = AVAudioPlayer()
    
    static let sharedInstance:backgroundMusicPlayer = {
        let instance = backgroundMusicPlayer ()
        return instance
    } ()
    
    func playMusic(for story: Story) {
        let url = story.musicURL

        do {
            bgPlayer = try AVAudioPlayer(contentsOf: url)
            bgPlayer.numberOfLoops = -1
            bgPlayer.prepareToPlay()
            bgPlayer.play()
        }
        catch let error as NSError {
            print(error.description)
        }
    }

    func stopMusic() {
        bgPlayer.stop()
    }
}

