//
//  UIDatePicker+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UIDatePicker {
    /// A publisher emitting date changes from this date picker.
    public var datePublisher: AnyPublisher<Date, Never> {
      Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.date)
        .eraseToAnyPublisher()
    }

    /// A publisher emitting countdown duration changes from this date picker.
    public var countDownDurationPublisher: AnyPublisher<TimeInterval, Never> {
      Publishers.ControlProperty(
        control: self,
        events: .defaultValueEvents,
        keyPath: \.countDownDuration
      )
      .eraseToAnyPublisher()
    }
  }
#endif
