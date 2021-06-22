//
//  UIPageControl+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 02/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import Combine
  import UIKit

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UIPageControl {
    /// A publisher emitting current page changes for this page control.
    public var currentPagePublisher: AnyPublisher<Int, Never> {
      publisher(for: \.currentPage).eraseToAnyPublisher()
    }
  }
#endif
