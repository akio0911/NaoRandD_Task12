//
//  ViewController.swift
//  AppDojoTask12
//
//  Created by Naoyuki Kan on 2021/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var noTaxLabel: UITextField!
    @IBOutlet private weak var taxRateLabel: UITextField!
    @IBOutlet private weak var includeTaxLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taxRateLabel.text = UserDefaults.standard.string(forKey: "TaxLate") ?? ""
        // キーボードの入力を数字に設定
        noTaxLabel.keyboardType = .numberPad
        taxRateLabel.keyboardType = .numberPad
    }

    // 計算ボタンがタップされたときに走る処理
    @IBAction func tappedCalButton(_ sender: Any) {
        // 税抜金額と消費税率を取得して計算する
        guard let noTaxAmount = Int(noTaxLabel.text!),
              let taxRate = Int(taxRateLabel.text!) else {
            return
        }
        let amountIncludeTax = Float(noTaxAmount) * (1.0 + Float(taxRate) / 100.0)
        // 消費税率をUserDefaultsに保存する
        UserDefaults.standard.set(taxRate, forKey: "TaxLate")

        // 計算結果を結果ラベルに反映する
        includeTaxLabel.text = String(Int(amountIncludeTax))
    }
}
