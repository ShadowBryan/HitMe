//
//  ViewController.swift
//  HitMe
//
//  实例变量：slider、、、因为变量数据不是int，而是滑动条对象，而且我们不是用常规的实例变量，而是一个特殊的实例变量，其类型为outlet。这行代码告诉Interface Builder（图形用户界面），现在我们有一个名为slider的变量，它可以和某个UISlider对象关联在一起。       在创建outlet类型变量时，使用@IBOutlet weak let的形式。
//  Created by Mac on 16/1/20.
//  Copyright © 2016年 Aispb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var HUD:MBProgressHUD?
    //  current,当前值
    var currentValue = 0
    //  score,得分
    var score = 0
    var round = 0
    //  实例sliderLabel
    @IBOutlet weak var  slider:UISlider!
    
    //  target，目标值
    var targetValue = 0
    //  实例Label:target
    @IBOutlet weak var targetLabel:UILabel!
    
    //  实例label：score
    @IBOutlet weak var scoreLabel:UILabel!
    //  实例label：round
    @IBOutlet weak var roundLabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        updateLabel()
        sliderEmbellish()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //  方法：弹出alert
    @IBAction func showAlert(){
        
        //  different，差值
        let different = abs(currentValue-targetValue)
        //  points，得分
        var points = 100 - different
        
        //  title，alert标题
        var title = ""
        
        //  if，根据different判断输出title
        if  different == 0 {
            title = "完美！你真是神了！"
                points += 100
        }else if different < 5 {
            title = "就差一点点了，你可以的！"
            points += 50
        }else if different < 10 {
            title = "再接再厉，胜利在望！"
        }else {
                title = "说真的，你不适合玩游戏！"
        }
        //  score，总得分
        score += points

        let message = "你的得分：\(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "我知道了", style: .Default, handler: {
                                                                        action in
                                                                            self.StartNewRound()
                                                                            self.updateLabel()
        })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
//        StartNewRound()
//        updateLabel()
    }
    
    //  方法：移动slider
    @IBAction func sliderMoved(slider:UISlider){
        currentValue = lroundf(slider.value)
        
    }
    
    //  方法：start新一轮
    func StartNewRound(){
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        round += 1
        slider.value = Float(currentValue)
    }
    
    //  方法：更新label
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    //  方法：新的游戏
    func startNewGame(){
        round = 0
        score = 0
        StartNewRound()
    }
    //  （动作）方法：新的游戏
    @IBAction func startOver(){
        startNewGame()
        updateLabel()
    }
    
    //  美化滑动条
    func sliderEmbellish(){
    //  滑动条结点的美化
        //  滑动条小圆点正常状态
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        //  滑动条小按钮高亮状态
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
    //  滑动条背景的美化
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        //  滑动条trackLeft的背景
        if let trackLeftImage = UIImage(named: "SliderTrackLeft"){
            let trackLeftReResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftReResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight"){
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    
    }
}








