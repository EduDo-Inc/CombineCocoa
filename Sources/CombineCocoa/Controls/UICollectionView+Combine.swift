//
//  UICollectionView+Combine.swift
//  CombineCocoa
//
//  Created by Joan Disho on 05/04/20.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(UIKit) && canImport(Combine)
  import Foundation
  import UIKit
  import Combine

  // swiftlint:disable force_cast
  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  extension UICollectionView {
    /// Combine wrapper for `collectionView(_:didSelectItemAt:)`
    public var didSelectItemPublisher: AnyPublisher<IndexPath, Never> {
      let selector = #selector(UICollectionViewDelegate.collectionView(_:didSelectItemAt:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { $0[1] as! IndexPath }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:didDeselectItemAt:)`
    public var didDeselectItemPublisher: AnyPublisher<IndexPath, Never> {
      let selector = #selector(UICollectionViewDelegate.collectionView(_:didDeselectItemAt:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { $0[1] as! IndexPath }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:didHighlightItemAt:)`
    public var didHighlightItemPublisher: AnyPublisher<IndexPath, Never> {
      let selector = #selector(UICollectionViewDelegate.collectionView(_:didHighlightItemAt:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { $0[1] as! IndexPath }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:didUnhighlightItemAt:)`
    public var didUnhighlightRowPublisher: AnyPublisher<IndexPath, Never> {
      let selector = #selector(UICollectionViewDelegate.collectionView(_:didUnhighlightItemAt:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { $0[1] as! IndexPath }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:willDisplay:forItemAt:)`
    public var willDisplayCellPublisher:
      AnyPublisher<(cell: UICollectionViewCell, indexPath: IndexPath), Never>
    {
      let selector = #selector(UICollectionViewDelegate.collectionView(_:willDisplay:forItemAt:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { ($0[1] as! UICollectionViewCell, $0[2] as! IndexPath) }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:willDisplaySupplementaryView:forElementKind:at:)`
    public var willDisplaySupplementaryViewPublisher:
      AnyPublisher<
        (supplementaryView: UICollectionReusableView, elementKind: String, indexPath: IndexPath),
        Never
      >
    {
      let selector = #selector(
        UICollectionViewDelegate.collectionView(_:willDisplaySupplementaryView:forElementKind:at:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { ($0[1] as! UICollectionReusableView, $0[2] as! String, $0[3] as! IndexPath) }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:didEndDisplaying:forItemAt:)`
    public var didEndDisplayingCellPublisher:
      AnyPublisher<(cell: UICollectionViewCell, indexPath: IndexPath), Never>
    {
      let selector = #selector(
        UICollectionViewDelegate.collectionView(_:didEndDisplaying:forItemAt:))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { ($0[1] as! UICollectionViewCell, $0[2] as! IndexPath) }
        .eraseToAnyPublisher()
    }

    /// Combine wrapper for `collectionView(_:didEndDisplayingSupplementaryView:forElementKind:at:)`
    public var didEndDisplaySupplementaryViewPublisher:
      AnyPublisher<
        (supplementaryView: UICollectionReusableView, elementKind: String, indexPath: IndexPath),
        Never
      >
    {
      let selector = #selector(
        UICollectionViewDelegate.collectionView(
          _:
          didEndDisplayingSupplementaryView:
          forElementOfKind:
          at:
        ))
      return delegateProxy.interceptSelectorPublisher(selector)
        .map { ($0[1] as! UICollectionReusableView, $0[2] as! String, $0[3] as! IndexPath) }
        .eraseToAnyPublisher()
    }

    private var delegateProxy: CollectionViewDelegateProxy {
      .createDelegateProxy(for: self)
    }
  }

  @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  private class CollectionViewDelegateProxy: DelegateProxy, UICollectionViewDelegate,
    DelegateProxyType
  {
    func setDelegate(to object: UICollectionView) {
      object.delegate = self
    }
  }
#endif
// swiftlint:enable force_cast
