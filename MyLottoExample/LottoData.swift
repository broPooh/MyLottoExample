//
//  LottoData.swift
//  MyLottoExample
//
//  Created by bro on 2022/05/09.
//

import Foundation


/*{
    "totSellamnt":88625160000,
    "returnValue":"success",
    "drwNoDate":"2020-03-21",
    "firstWinamnt":1684582212,
    "firstPrzwnerCo":13,
    "firstAccumamnt":21899568756,
    "drwNo":903, // 몇회
    "drwtNo1":2,
    "drwtNo2":15,
    "drwtNo3":16,
    "drwtNo4":21,
    "drwtNo5":22,
    "drwtNo6":28,
    "bnusNo":45
 }
*/

struct LottoData {
    var totSellamnt: String
    var drwNoDate: String
    var firstAccumamnt: String
    var drawNo: String
    var drwtNo1: String
    var drwtNo2: String
    var drwtNo3: String
    var drwtNo4: String
    var drwtNo5: String
    var drwtNo6: String
    var bnusNo: String
}
