//
//  UITextField+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UITextField {
    /// A publisher emitting any text changes to a this text field.
    public var textPublisher: AnyPublisher<String?, Never> {
      Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.text)
        .eraseToAnyPublisher()
    }

    /// A publisher emitting any attributed text changes to this text field.
    public var attributedTextPublisher: AnyPublisher<NSAttributedString?, Never> {
      Publishers.ControlProperty(
        control: self,
        events: .defaultValueEvents,
        keyPath: \.attributedText
      )
      .eraseToAnyPublisher()
    }

    /// A publisher that emits whenever the user taps the return button and ends the editing on the text field.
    public var returnPublisher: AnyPublisher<Void, Never> {
      controlEventPublisher(for: .editingDidEndOnExit)
    }

    /// A publisher that emits whenever the user taps the text fields and begin the editing.
    public var didBeginEditingPublisher: AnyPublisher<Void, Never> {
      controlEventPublisher(for: .editingDidBegin)
    }
  }
#endif
