//
//  SoundsExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 14/10/22.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case cow = "Cow-moo-sound"
        case duck = "Duck-quack"
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
                print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
}

struct SoundsExample: View {
    
    var body: some View {
        VStack (spacing:40) {
            Button("Play Sound") {
                SoundManager.instance.playSound(sound: .cow)
            }
            Button("Play Another Sound") {
                SoundManager.instance.playSound(sound: .duck)
            }
        }
    }
}

struct SoundsExample_Previews: PreviewProvider {
    static var previews: some View {
        SoundsExample()
    }
}
