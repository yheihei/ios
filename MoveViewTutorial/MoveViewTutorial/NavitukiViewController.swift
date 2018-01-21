//
//  NavitukiViewController.swift
//  MoveViewTutorial
//
//  Created by 小久保洋平 on 2018/01/19.
//  Copyright © 2018年 小久保洋平. All rights reserved.
//

import UIKit

class NavitukiViewController: UIViewController {

    var receiveText:String? // 前画面からのテキストがここに入る
    @IBOutlet weak var showTextLabel: UILabel!
    
    @IBOutlet weak var returnTextField: UITextField! // 前画面に戻すテキスト
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard self.receiveText != nil else {
            // 何も文字を受け取っていなければ表示を更新しない
            return
        }
        
        // 前画面から受け取ったtextを入れる
        self.showTextLabel.text = receiveText!
        
        // hoge

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
       // 表示元がViewControllerかNavigationControllerかで消し方が違う
        if self.presentingViewController is UINavigationController {
            //  表示元がNavigationControllerの場合
            self.dismiss(animated: true, completion: nil)
        } else {
            // 表示元がViewControllerの場合
            self.navigationController?.popViewController(animated: true)
        }
    }                                                                                   
    
    
    @IBAction func done(_ sender: Any) {
        // 表示の大元がViewControllerかNavigationControllerかで戻る場所を判断する
        if self.presentingViewController is UINavigationController {
            //  表示の大元がNavigationControllerの場合
            let nc = self.presentingViewController as! UINavigationController
            let vc = nc.topViewController as! TopViewController
            vc.receivedTextLabel.text = self.returnTextField.text
            self.dismiss(animated: true, completion: nil)
            
        } else {
            // 表示元がViewControllerの場合
            // 前画面のViewControllerを取得
            let count = (self.navigationController?.viewControllers.count)! - 2
            let vc = self.navigationController?.viewControllers[count] as! SingleViewController
            vc.receivedTextLabel.text = self.returnTextField.text
            // 画面を消す
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
