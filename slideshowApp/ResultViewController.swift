//
//  ResultViewController.swift
//  slideshowApp
//
//  Created by 丸山薫 on 2019/09/12.
//  Copyright © 2019 kaoru.maruyama. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //2画面目のimageをStoryboardでこのViewControllにIBOutlet接続しておく
    @IBOutlet weak var scope: UIImageView!
    
    
    //受け取るためのプロパティを宣言しておく
    var scopeImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let result = scopeImage
        scope.image = scopeImage
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
