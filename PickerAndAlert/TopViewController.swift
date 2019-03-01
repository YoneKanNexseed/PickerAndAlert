//
//  TopViewController.swift
//  PickerAndAlert
//
//  Created by yonekan on 2019/03/01.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // DatePicker（日付のｓ部品）を接続
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // PickerView（都道府県を表示する部品）を接続
    @IBOutlet weak var pickerView: UIPickerView!
    
    // 都道府県の配列
    let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県",
                       "山形県", "福島県", "茨城県", "栃木県", "群馬県",
                       "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県",
                       "富山県", "石川県", "福井県", "山梨県", "長野県",
                       "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県",
                       "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
                       "鳥取県", "島根県", "岡山県", "広島県", "山口県",
                       "徳島県", "香川県", "愛媛県", "高知県", "福岡県",
                       "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
                       "鹿児島県", "沖縄県"]

    // 画面が表示される時に実行
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ピッカービューの列・行数や表示する文字の設定を
        // 画面のピッカービューに反映させる
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // ピッカービューの行数
        return prefectures.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // ピッカービューの列数
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 行に表示される文字の設定
        return prefectures[row]
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        // ここでアラートを作って、変数（箱）に保存
        let alert = UIAlertController(title: "ここがタイトル！！！", message: "操作を選択してください", preferredStyle: .alert)
        
        // 出力ボタンを作成
        let printAction = UIAlertAction(title: "出力", style: .default) { (UIAlertAction) in
            print(self.datePicker.date)
        }
        
        // キャンセルボタンを作成
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (UIAlertAction) in
            print("キャンセルが押されたよ")
        }
        
        // クリアボタンを作成
        let clearAction = UIAlertAction(title: "クリア", style: .destructive) { (UIAlertAction) in
            print("クリアが押されたよ")
        }
        
        // アラートにボタンを追加
        alert.addAction(printAction)
        alert.addAction(cancelAction)
        alert.addAction(clearAction)
        
        // モーダルでアラートを表示する
        present(alert, animated: true, completion: nil)
    }
}
