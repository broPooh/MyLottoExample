//
//  ViewController.swift
//  MyLottoExample
//
//  Created by bro on 2022/05/09.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lottoRoundTextFiled: UITextField!
    @IBOutlet weak var lottoRoundLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var lottoNumLabel1: UILabel!
    @IBOutlet weak var lottoNumLabel2: UILabel!
    @IBOutlet weak var lottoNumLabel3: UILabel!
    @IBOutlet weak var lottoNumLabel4: UILabel!
    @IBOutlet weak var lottoNumLabel5: UILabel!
    @IBOutlet weak var lottoNumLabel6: UILabel!
    @IBOutlet weak var lottoBonusLabel: UILabel!
    @IBOutlet weak var moneyButton: UIButton!
    
    @IBOutlet weak var lottoLabelStacView: UIStackView!
    
    var lottoNumLabels: [UILabel] = []
    var lottoNumbers: [Int] = []
    var lottoData: LottoData? = nil
    
    var textFiledNumber = 986
    
    var round = 0 {
        didSet {
            fetchLottoNumberData(number: round)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewConfig()
        initLottoRound()
    }
    
    
    func viewConfig() {
        initLottoNumLabel()
        containerViewConfig()
        lottoRoundTextFiledConfig()
        lottoNumLabelConfig()
        buttonConfig()
    }

    func containerViewConfig() {
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .black
    }
    
    func initLottoNumLabel() {
        lottoNumLabels.append(lottoNumLabel1)
        lottoNumLabels.append(lottoNumLabel2)
        lottoNumLabels.append(lottoNumLabel3)
        lottoNumLabels.append(lottoNumLabel4)
        lottoNumLabels.append(lottoNumLabel5)
        lottoNumLabels.append(lottoNumLabel6)
        lottoNumLabels.append(lottoBonusLabel)
    }
    
    
    func lottoNumLabelConfig() {
        let radius = 20
        for label in lottoNumLabels {
            label.clipsToBounds = true
            label.layer.cornerRadius = CGFloat(radius)
        }
    }
    
    func buttonConfig() {
        moneyButton.backgroundColor = UIColor(red: 247/255, green: 237/255, blue: 171/255, alpha: 1)
        moneyButton.layer.cornerRadius = 10
    }
    
    func setLottoNumLabelBackgroundColor(number: Int, label: UILabel) {
        label.text = "\(number)"
        switch number {
        case 1...10 : label.backgroundColor = UIColor(red: 247/255, green: 237/255, blue: 171/255, alpha: 1)
        case 11...20 : label.backgroundColor = UIColor(red: 87/255, green: 157/255, blue: 222/255, alpha: 1)
        case 21...30 : label.backgroundColor = UIColor(red: 240/255, green: 70/255, blue: 115/255, alpha: 1)
        case 31...40 : label.backgroundColor = UIColor(red: 53/255, green: 55/255, blue: 66/255, alpha: 1)
        default : label.backgroundColor = UIColor(red: 193/255, green: 227/255, blue: 208/255, alpha: 1)
        }
    }
    
    func fetchLottoNumberData(number: Int) {
        guard let url = Constants.getLottoNumUrl(number: number) else {
            return
        }
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonData = JSON(value)
                
                self.lottoNumbers.removeAll()
                
                let totSellamnt = jsonData["totSellamnt"].stringValue
                let drwNoDate = jsonData["drwNoDate"].stringValue
                let firstAccumamnt = jsonData["firstAccumamnt"].stringValue
                let drawNo = jsonData["drawNo"].stringValue
                let drwtNo1 = jsonData["drwtNo1"].stringValue
                let drwtNo2 = jsonData["drwtNo2"].stringValue
                let drwtNo3 = jsonData["drwtNo3"].stringValue
                let drwtNo4 = jsonData["drwtNo4"].stringValue
                let drwtNo5 = jsonData["drwtNo5"].stringValue
                let drwtNo6 = jsonData["drwtNo6"].stringValue
                let bnusNo = jsonData["bnusNo"].stringValue
                
                self.lottoNumbers.append(Int(drwtNo1)!)
                self.lottoNumbers.append(Int(drwtNo2)!)
                self.lottoNumbers.append(Int(drwtNo3)!)
                self.lottoNumbers.append(Int(drwtNo4)!)
                self.lottoNumbers.append(Int(drwtNo5)!)
                self.lottoNumbers.append(Int(drwtNo6)!)
                self.lottoNumbers.append(Int(bnusNo)!)

                self.lottoData = LottoData(totSellamnt: totSellamnt, drwNoDate: drwNoDate, firstAccumamnt: firstAccumamnt, drawNo: drawNo, drwtNo1: drwtNo1, drwtNo2: drwtNo2, drwtNo3: drwtNo3, drwtNo4: drwtNo4, drwtNo5: drwtNo5, drwtNo6: drwtNo6, bnusNo: bnusNo)
                
                
                self.updateLottoData(lottoData: self.lottoData!)
                
            case.failure(let error):
                self.showErrorAlert(title: "네트워크 에러", message: "데이터를 받아오지 못했습니다.")
            }
        }
    }
    
    func updateLottoData(lottoData: LottoData) {
        lottoRoundTextFiled.text = lottoData.drawNo
        lottoRoundLabel.text = lottoData.drawNo
        dateLabel.text = lottoData.drwNoDate
        
        
        let labelZip = zip(lottoNumLabels, lottoNumbers)
        
        for (label, number) in labelZip {
            setLottoNumLabelBackgroundColor(number: number, label: label)
        }
        
//        lottoNumLabel1.text = lottoData.drwtNo1
//        lottoNumLabel1.text = lottoData.drwtNo1
//        lottoNumLabel1.text = lottoData.drwtNo1
//        lottoNumLabel1.text = lottoData.drwtNo1
//        lottoNumLabel1.text = lottoData.drwtNo1
//        lottoNumLabel1.text = lottoData.drwtNo1
//
//        setLottoNumLabelBackgroundColor(number: Int(lottoData.drwtNo1)!, label: lottoNumLabel1)
//        setLottoNumLabelBackgroundColor(number: Int(lottoData.drwtNo2)!, label: lottoNumLabel2)
//        setLottoNumLabelBackgroundColor(number: Int(lottoData.drwtNo3)!, label: lottoNumLabel3)
//        setLottoNumLabelBackgroundColor(number: Int(lottoData.drwtNo4)!, label: lottoNumLabel4)
//        setLottoNumLabelBackgroundColor(number: Int(lottoData.drwtNo5)!, label: lottoNumLabel5)
//        setLottoNumLabelBackgroundColor(number: Int(lottoData.drwtNo6)!, label: lottoNumLabel6)
    }
    
    func lottoRoundTextFiledConfig() {
        lottoRoundTextFiled.textColor = .label
        lottoRoundTextFiled.tintColor = .clear
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        lottoRoundTextFiled.inputView = pickerView
    }
    
    func initLottoRound() {
        //로또 1회차 2002년 12월 7일
        let firstLottoNumDateComponents = DateComponents(year: 2002, month: 12, day: 7)
        let firstDateCalandar = Calendar.current.date(from: firstLottoNumDateComponents)!
                
        let checkWeeks = Calendar.current.dateComponents([.weekOfMonth], from: firstDateCalandar, to: Date())

        
        if let roundWeek = checkWeeks.weekOfMonth {
            let lastRound = roundWeek + 1
            
            let todayComponent = Calendar.current.dateComponents([.weekday, .hour], from: Date())
            let weekday = todayComponent.weekday
            let hour = todayComponent.hour
            
            //weekday -> 1 ~ 7로 월화수목금토일 표기, 일요일이 1, 토요일은 7
            if weekday == 7 && hour! < 20 {
                round = lastRound - 1
                textFiledNumber = lastRound - 1
            } else {
                round = lastRound
                textFiledNumber = lastRound
            }
        }
        
    }

    @IBAction func moneyButtonClicked(_ sender: UIButton) {
        guard let data = lottoData else {
            self.showErrorAlert(title: "데이터 에러", message: "로또 정보가 없습니다.")
            return
        }
        
        self.showAlert(title: "당첨금액 확인", message: "1등 당첨금액은 \(data.totSellamnt)원 입니다!", okTitle: "확인") {
            print("\(data.totSellamnt)")
        }
    }
}


// MARK: - PickerView Delegate
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return textFiledNumber
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(textFiledNumber - row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        round = textFiledNumber - row
        lottoRoundTextFiled.text = "\(round)"
        print("\(round)")
        lottoRoundTextFiled.resignFirstResponder()
    }
}
