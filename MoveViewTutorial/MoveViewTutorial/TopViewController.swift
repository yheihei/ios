//
//  TopViewController.swift
//  MoveViewTutorial
//
//  Created by 小久保洋平 on 2018/01/19.
//  Copyright © 2018年 小久保洋平. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var sendingTextField: UITextField!
    @IBOutlet weak var receivedTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // segueによる遷移前にここを通る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            // identifierが取れなかったら処理やめる
            return
        }
        
        if(identifier == "ncSegue") {
            // NavigationControllerへの遷移の場合
            
            // segueから遷移先のNavigationControllerを取得
            let nc = segue.destination as! UINavigationController
            
            // NavigationControllerの一番目のViewControllerが次の画面
            let vc = nc.topViewController as! NavitukiViewController
            
            // 次画面のテキスト表示用ラベルのテキストを、本画面のテキストフィールドのテキストに
            vc.receiveText = self.sendingTextField.text
        }
    }
    
    
    @IBAction func moveNC(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        // 設定したidentifier名でNavigationControllerを取得
        let nc = storyboard.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
        
        // NavigationControllerの一番目のViewControllerが次の画面
        let vc = nc.topViewController as! NavitukiViewController
        
        // 次画面のテキスト表示用ラベルのテキストを、本画面のテキストフィールドのテキストに
        vc.receiveText = self.sendingTextField.text
        
        // NavigationControllerを表示(NCのトップのViewControllerが表示される)
        self.present(nc, animated: true, completion: nil)
    }
    
    // 次画面から戻ってくるときに呼ばれる
    @IBAction func unwindToTop(sender: UIStoryboardSegue) {
        // 次画面のNavitukiViewControllerを受け取る
        guard let sourceVC = sender.source as? NavitukiViewController else {
            // NavitukiViewControllerでなかったらやめる
            return
        }
        
        // NavitukiViewControllerの値を受け取って更新
        self.receivedTextLabel.text = sourceVC.returnTextField.text
    }

}
