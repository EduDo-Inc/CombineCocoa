//
//  UISwitch+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UISwitch {
    /// A publisher emitting on status changes for this switch.
    public var isOnPublisher: AnyPublisher<Bool, Never> {
      Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.isOn)
        .eraseToAnyPublisher()
    }
  }
#endif
