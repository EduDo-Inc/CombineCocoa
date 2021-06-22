//
//  UISlider+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UISlider {
    /// A publisher emitting value changes for this slider.
    public var valuePublisher: AnyPublisher<Float, Never> {
      Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.value)
        .eraseToAnyPublisher()
    }
  }
#endif
