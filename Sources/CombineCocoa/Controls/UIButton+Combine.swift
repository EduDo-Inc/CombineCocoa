//
//  UIButton+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(iOS 13.0, *)
  extension UIButton {
    /// A publisher emitting tap events from this button.
    public var tapPublisher: AnyPublisher<Void, Never> {
      controlEventPublisher(for: .touchUpInside)
    }
  }
#endif
