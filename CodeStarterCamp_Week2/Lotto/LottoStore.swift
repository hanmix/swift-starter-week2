//
//  LottoStore.swift
//  CodeStarterCamp_Week2
//
//  Created by 조민호 on 2021/12/15.
//

import Foundation

struct LottoStore {
    let lottoNumberGenerator: LottoNumberGenerator
    let lottoWinningNumber: [Int]
    
    private(set) var overlappedNumber: [Int] = []
    
    init(lottoNumberGenerator: LottoNumberGenerator) {
        self.lottoNumberGenerator = lottoNumberGenerator
        self.lottoWinningNumber = lottoNumberGenerator.generateLottoNumbers()
    }
    
    mutating func findOverlapNumbers() {
        self.overlappedNumber = LottoOptions
            .myLottoNumbers
            .filter { lottoWinningNumber.contains($0) }
        
        printOverlapNumbers()
    }
    
    private func printOverlapNumbers() {
        if overlappedNumber.count != 0 {
            print("축하합니다! 겹치는 번호는 \(converToString(overlappedNumber)) 입니다!")
        }
        
        if overlappedNumber.count == 0 {
            print("아쉽지만 겹치는 번호가 없습니다.")
        }
    }
}

extension LottoStore {
    private func converToString(_ numbers: [Int]) -> String {
        numbers
            .map{ String($0) }
            .joined(separator: ", ")
    }
}
