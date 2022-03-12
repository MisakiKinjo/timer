//
//  ViewController.swift
//  timer
//
//  Created by 金城美咲 on 2022/03/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    //　タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //タイマーの作成、始動
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    
    // selector:#selector(updatetimer(_:))　で指定された関数
    // timeInterval: 0.1, repeats:true　で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "&.1f", self.timer_sec)
    }
    
    //再生ボタン
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    
    //一時停止ボタン
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //リセットボタン
    @IBAction func resetTimer(_ sender: Any) {
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    

}

