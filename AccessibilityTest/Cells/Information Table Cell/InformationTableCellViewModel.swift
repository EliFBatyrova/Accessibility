//
//  InformationTableCellViewModel.swift
//  AccessibilityTest
//
//  Created by Elina Batyrova on 05.11.2022.
//

import Foundation

struct InformationTableCellViewModel {
    
    /// Заголовок
    var title: String
    
    /// Подзаголовок
    var subtitle: String
    
    /// Надпись с датой
    var dateTitle: String
    
    // MARK: - Init
    
    init(title: String, subtitle: String, dateTitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.dateTitle = dateTitle
    }
}
