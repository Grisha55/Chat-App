//
//  Message.swift
//  ChatApp
//
//  Created by Григорий Виняр on 05/09/2022.
//

import Foundation
import MessageKit

struct Message: MessageType {
  var sender: SenderType
  var messageId: String
  var sentDate: Date
  var kind: MessageKind
}
