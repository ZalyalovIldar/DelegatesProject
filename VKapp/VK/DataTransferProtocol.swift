//
//  DataTransferProtocol.swift
//  VK
//
//  Created by Elina on 08/10/2017.
//  Copyright © 2017 Elina. All rights reserved.
//

import Foundation

/// Протокол для передачи данных между контроллерами обратно
protocol DataTransferProtocol {
    /// Обработка нажатия return на клаве
    ///
    /// - Parameter text: входящий текст
    func didPressReturn(with text: String)
}

extension DataTransferProtocol {
    
    func didPressReturn(with text: String) {
        print(text)
    }
}
