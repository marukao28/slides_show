//
//  ViewController.swift
//  slideshowApp
//
//  Created by 丸山薫 on 2019/09/12.
//  Copyright © 2019 kaoru.maruyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onTapImage(_ sender: AnyObject) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    let images = [UIImage(named: "images1"),UIImage(named: "images3"),UIImage(named: "images2"),UIImage(named: "images4")]
    var imageIndex = 0
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    // バンドルした画像ファイルを読み込み
    
    imageView.image = images[0]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue から遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as!ResultViewController
        resultViewController.scopeImage = imageView.image
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex < 3 {
            imageIndex += 1
        } else {
        imageIndex -= 3
        }
    imageView.image = images[imageIndex]
    }
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 3
        } else {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 3 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBOutlet weak var backImage: UIButton!
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var startstopImage: UIButton!
    @IBAction func startstopImage(_ sender: Any) {
        startstopImage.setTitle ("停止" , for : .normal)

        nextImage.isEnabled = false
        nextImage.setTitleColor(UIColor.lightGray, for: .normal)
        backImage.isEnabled = false
        backImage.setTitleColor(UIColor.lightGray, for: .normal)
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer( _:)), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
            startstopImage.setTitle("再生", for: .normal)
            timer=nil

            nextImage.isEnabled = true
            nextImage.setTitleColor(UIColor.darkText, for: .normal)
            backImage.isEnabled = true
            backImage.setTitleColor(UIColor.darkText, for: .normal)


        }
    }
}

