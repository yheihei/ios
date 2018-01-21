//
//  SingleViewController.swift
//  MoveViewTutorial
//
//  Created by 小久保洋平 on 2018/01/19.
//  Copyright © 2018年 小久保洋平. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            // identifierが取れなかったら処理やめる
            return
        }
        
        if(identifier == "vcToNCTukiVC") {
            // NCつきViewControllerへの遷移の場合
            
            // segueから遷移先のViewControllerを取得
            let vc = segue.destination as! NavitukiViewController
            
            // 次画面のテキスト表示用ラベルのテキストを、本画面のテキストフィールドのテキストに
            vc.receiveText = self.sendingTextField.text
        }
    }
    
    @IBAction func moveNabitukiVC(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        // 設定したidentifier名で次画面のViewControllerを取得
        let vc = storyboard.instantiateViewController(withIdentifier: "navitukiView") as! NavitukiViewController
        
        // 次画面のテキスト表示用ラベルのテキストを、本画面のテキストフィールドのテキストに
        vc.receiveText = self.sendingTextField.text
        
        // 次画面のViewControllerを表示
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
