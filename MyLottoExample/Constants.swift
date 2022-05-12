//
//  Constants.swift
//  MyLottoExample
//
//  Created by bro on 2022/05/09.
//

import Foundation


struct Constants {
        
    static func getLottoNumUrl(round: String) -> String? {
        return "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
    }
}
