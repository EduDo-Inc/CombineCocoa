//
//  UISearchBar+Combine.swift
//  CombineCocoa
//
//  Created by Kevin Renskers on 01/10/2020.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine) && os(iOS)
  import UIKit
  import Combine

  // swiftlint:disable force_cast
  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UISearchBar {
    /// Combine wrapper for `UISearchBarDelegate.searchBar(_:textDidChange:)`
    public var textDidChangePublisher: AnyPublisher<String, Never> {
      let selector = #selector(UISearchBarDelegate.searchBar(_:textDidChange:))
      return
        delegateProxy
        .interceptSelectorPublisher(selector)
        .map { $0[1] as! String }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `UISearchBarDelegate.searchBarSearchButtonClicked(_:)`
    public var searchButtonClickedPublisher: AnyPublisher<Void, Never> {
      let selector = #selector(UISearchBarDelegate.searchBarSearchButtonClicked(_:))
      return
        delegateProxy
        .interceptSelectorPublisher(selector)
        .map { _ in () }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `UISearchBarDelegate.searchBarCancelButtonClicked(_:)`
    public var cancelButtonClickedPublisher: AnyPublisher<Void, Never> {
      let selector = #selector(UISearchBarDelegate.searchBarCancelButtonClicked(_:))
      return
        delegateProxy
        .interceptSelectorPublisher(selector)
        .map { _ in () }
        .eraseToAnyPublisher()
    }

    private var delegateProxy: UISearchBarDelegateProxy {
      .createDelegateProxy(for: self)
    }
  }

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  private class UISearchBarDelegateProxy: DelegateProxy, UISearchBarDelegate, DelegateProxyType {
    func setDelegate(to object: UISearchBar) {
      object.delegate = self
    }
  }
#endif
// swiftlint:enable force_cast
