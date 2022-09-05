//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Григорий Виняр on 05/09/2022.
//

import UIKit
import MessageKit

class ChatViewController: MessagesViewController {

  // MARK: - Properties
  let currentUser = Sender(senderId: "currentId", displayName: "John Smith")
  let otherUser = Sender(senderId: "otherId", displayName: "Nikola Brawn")
  
  var messages: [MessageType] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMessagesCollectionView()
        getMessages()
    }
    
  // MARK: - Methods
  private func getMessages() {
    messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hello bro!")))
    
    messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-86400), kind: .text("Hi")))
    
    messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-86400), kind: .text("What's up men?")))
    
    messages.append(Message(sender: otherUser, messageId: "4", sentDate: Date().addingTimeInterval(-86400), kind: .text("Everything is ok, and you?")))
    
    messages.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-86400), kind: .text("Good too")))
  }
  
  private func setupMessagesCollectionView() {
    messagesCollectionView.messagesDataSource = self
    messagesCollectionView.messagesLayoutDelegate = self
    messagesCollectionView.messagesDisplayDelegate = self
  }
  
}

// MARK: - MessagesDisplayDelegate
extension ChatViewController: MessagesDisplayDelegate {
  
}

// MARK: - MessagesLayoutDelegate
extension ChatViewController: MessagesLayoutDelegate {
  
}

// MARK: - MessagesDataSource
extension ChatViewController: MessagesDataSource {
  
  func currentSender() -> SenderType {
    return currentUser
  }
  
  func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
    return messages[indexPath.section]
  }
  
  func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
    return messages.count
  }
}
