//
//  Level.swift
//  CookieCrunch
//
//  Created by Christopher Winstanley on 28/05/2015.
//  Copyright (c) 2015 Winstanley. All rights reserved.
//

import Foundation


let NumColumns = 9
let NumRows = 9

class Level {
    private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
    
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
        return createInitialCookies()
    }
    
    private func createInitialCookies() -> Set<Cookie> {
        var set = Set<Cookie>()
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                var cookieType = CookieType.random()
                let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                cookies[column, row] = cookie
                set.insert(cookie)
            }
        }
        return set
    }
}

