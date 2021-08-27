//
//  SplashVC.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/27/21.
//

import UIKit

class SplashVC: UIViewController {

    var player = TinyPlayer()
    
    var dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiatePlayer()
        
        dispatchGroup.notify(queue: .main) {
            self.checkForUserStatusAndEnterApp()
        }
    }
    func checkForUserStatusAndEnterApp() {
        createDashBoard()
//        if redirectionUrl == "" {
//            
//        } else {
//            DeepLinkManager.shared.initiateActivityWithURL(baseURL: redirectionUrl)
//        }
    
    }
    
    func initiatePlayer() {
        dispatchGroup.enter()   //-- ENTER 5
        self.player = TinyPlayer()
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        //self.player.enableAirplayMediaRoute = false
        self.player._avplayer.allowsExternalPlayback = false
        self.player.fillMode = .resizeAspectFill
        self.player.playbackFreezesAtEnd = true
        self.player.autoplay = true
        self.player.playbackLoops = false
       // self.player.view.frame = self.view.frame

        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
//        self.player.view.snp.makeConstraints { (make) in
//              make.top.equalTo(self.view)
//              make.bottom.equalTo(self.view)
//              make.leading.equalTo(self.view)
//              make.trailing.equalTo(self.view)
//          }
        playVideo()
    }
    func deInitPlayer() {
        self.player.playerDelegate = nil
        self.player.playbackDelegate = nil
        self.player.removeApplicationObservers()
        self.player.removeFromParent()

    }

    func playVideo() {
        if let path = Bundle.main.path(forResource: "splashVideo", ofType: "mp4") {
            let mediaUrl = NSURL(fileURLWithPath: path)//URL(string: path)
            self.player.url = mediaUrl as URL
            self.player.playFromBeginning()
            print("all good")
        } else {
            print("no good")
        }
    }
}

extension SplashVC : PlayerDelegate, PlayerPlaybackDelegate {
    func playerReady(_ player: TinyPlayer) {

    }

    func playerPlaybackStateDidChange(_ player: TinyPlayer) {

    }

    func playerBufferingStateDidChange(_ player: TinyPlayer) {

    }

    func playerDisappearFromBackGround(_ player: TinyPlayer) {

    }

    func playerBufferTimeDidChange(_ bufferTime: Double) {

    }

    func player(_ player: TinyPlayer, didFailWithError error: Error?) {

    }

    func playerCurrentTimeDidChange(_ player: TinyPlayer) {

    }

    func playerPlaybackWillStartFromBeginning(_ player: TinyPlayer) {

    }

    func playerPlaybackDidEnd(_ player: TinyPlayer) {
            player.stop()
            dispatchGroup.leave()   //-- LEAVE 5
    }

    func playerPlaybackWillLoop(_ player: TinyPlayer) {

    }


}
