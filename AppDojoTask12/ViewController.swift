//
//  ViewController.swift
//  AppDojoTask12
//
//  Created by Naoyuki Kan on 2021/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var noTaxTextField: UITextField!
    @IBOutlet private weak var taxRateTextField: UITextField!
    @IBOutlet private weak var includeTaxLabel: UILabel!

    private static let taxLateKey = "TaxLate"

    override func viewDidLoad() {
        super.viewDidLoad()

        taxRateTextField.text = UserDefaults.standard.string(forKey: Self.taxLateKey) ?? ""

        // キーボードの入力を数字に設定
        noTaxTextField.keyboardType = .numberPad
        taxRateTextField.keyboardType = .numberPad
    }

    // 計算ボタンがタップされたときに走る処理
    @IBAction func tappedCalButton(_ sender: Any) {
        // 税抜金額と消費税率を取得して計算する
        guard let noTaxAmount = Int(noTaxTextField.text!),
              let taxRate = Int(taxRateTextField.text!) else {
            return
        }
        let amountIncludeTax = Float(noTaxAmount) * (1.0 + Float(taxRate) / 100.0)
        // 消費税率をUserDefaultsに保存する
        UserDefaults.standard.set(taxRate, forKey: Self.taxLateKey)

        // 計算結果を結果ラベルに反映する
        includeTaxLabel.text = String(Int(amountIncludeTax))
    }
}
