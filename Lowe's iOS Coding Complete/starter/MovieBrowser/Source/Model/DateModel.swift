//
//  DateModel.swift
//  MovieBrowser
//
//  Created by developer on 6/13/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

let dateFormatDetails: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/dd/yy"
    return dateFormatter
}()

let dateFormatSearch: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    return dateFormatter
}()

let dateFormatIn: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter
}()
