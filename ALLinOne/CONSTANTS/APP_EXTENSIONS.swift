//
//  APP_EXTENSIONS.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/27/21.
//

import Foundation
import UIKit

extension StoryBoards {
    func getStoryBoard() -> UIStoryboard {
        return UIStoryboard.init(name: self.rawValue, bundle: nil)
    }
}
