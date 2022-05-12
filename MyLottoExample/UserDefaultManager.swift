//
//  UserDefaultManager.swift
//  MyLottoExample
//
//  Created by bro on 2022/05/12.
//

import Foundation

struct UserDefaultsManager {
    static let shared = UserDefaultsManager()
    typealias LottoData = [String : Any]
    
    func setLottoData(round: String, lottoData : LottoData) {
        UserDefaults.standard.set(lottoData, forKey: String(round))
    }
    
    func getLottoData(round: String) -> LottoData? {
        return UserDefaults.standard.value(forKey: String(round)) as? LottoData
    }
}
