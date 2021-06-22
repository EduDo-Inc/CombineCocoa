//
//  UISegmentedControl+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UISegmentedControl {
    /// A publisher emitting selected segment index changes for this segmented control.
    public var selectedSegmentIndexPublisher: AnyPublisher<Int, Never> {
      Publishers.ControlProperty(
        control: self,
        events: .defaultValueEvents,
        keyPath: \.selectedSegmentIndex
      )
      .eraseToAnyPublisher()
    }
  }
#endif
