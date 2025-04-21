//
//  ConsoleLogger.swift
//  CoordinatorMulti
//
//  Created by miris on 2/3/25.
//

import Foundation
import OSLog

struct ConsoleLogger{
    /// 파일명을 추출하는 공통 메서드
    private static func extractFileName(from filePath: String) -> String {
        let fileURL = if #available(iOS 16.0, *) {
            URL(filePath: filePath)
        } else {
            URL(fileURLWithPath: filePath)
        }
        let pathExtension = fileURL.pathExtension
        return "\(fileURL.deletingPathExtension().lastPathComponent).\(pathExtension)"
    }
    
    static func log(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = extractFileName(from: file)
        let logMessage = "\(message): \(fileName), \(function) line #\(line)"
        os_log("%{public}s", log: .default, type: .info, logMessage)
        #endif
    }
    
    static func classDeInitialized(file: String = #file) {
        #if DEBUG
        let fileName = extractFileName(from: file)
        print("\(fileName) is de-initialized.")
        #endif
    }
}
