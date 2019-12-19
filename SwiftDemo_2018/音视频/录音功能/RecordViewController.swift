//
//  RecordViewController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/2/18.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
import AVFoundation
class RecordViewController: UIViewController {

    //录音对象
    lazy var recorder : AVAudioRecorder = {
        let url = "/Users/hou/Desktop/record"
        //录音设置
        var setingDic = [String:Any]()
        //采样率
        setingDic[AVSampleRateKey] = 44100
        //录音格式
        setingDic[AVFormatIDKey] = kAudioFormatMPEG4AAC
        //录音通道
        setingDic[AVNumberOfChannelsKey] = 1
        //录音质量
        setingDic[AVEncoderAudioQualityKey] = AVAudioQuality.high

        let re = try! AVAudioRecorder.init(url: URL(string: url)!, settings: setingDic)
        //准备
        re.prepareToRecord()
        return re
    }()
    
    lazy var player:AVAudioPlayer = {
        let path = "/Users/hou/Desktop/record"
        let p = try! AVAudioPlayer.init(contentsOf: URL(string: path)!)
        p.prepareToPlay()
        return p
    }()
    @IBOutlet weak var recordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func recordBtn(_ sender: UIButton) {
        
        if sender.isSelected { //关闭录音
            recorder.stop()
        }else{//开启录音
            recorder.record()
        }
        recordBtn.isSelected = !recordBtn.isSelected
    }

    @IBAction func playClick(_ sender: UIButton) {
        
        self.player.play()
    }
    
}
