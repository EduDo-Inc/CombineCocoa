//
//  UIGestureRecognizer+Combine.swift
//  CombineCocoa
//
//  Created by Shai Mishali on 12/08/2019.
//  Copyright © 2020 Combine Community. All rights reserved.
//

#if canImport(Combine)
  import Combine
  import UIKit

  // MARK: - Gesture Publishers
  @available(iOS 13.0, *)
  extension UITapGestureRecognizer {
    /// A publisher which emits when this Tap Gesture Recognizer is triggered
    public var tapPublisher: AnyPublisher<UITapGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  @available(iOS 13.0, *)
  extension UIPinchGestureRecognizer {
    /// A publisher which emits when this Pinch Gesture Recognizer is triggered
    public var pinchPublisher: AnyPublisher<UIPinchGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  @available(iOS 13.0, *)
  extension UIRotationGestureRecognizer {
    /// A publisher which emits when this Rotation Gesture Recognizer is triggered
    public var rotationPublisher: AnyPublisher<UIRotationGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  @available(iOS 13.0, *)
  extension UISwipeGestureRecognizer {
    /// A publisher which emits when this Swipe Gesture Recognizer is triggered
    public var swipePublisher: AnyPublisher<UISwipeGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  @available(iOS 13.0, *)
  extension UIPanGestureRecognizer {
    /// A publisher which emits when this Pan Gesture Recognizer is triggered
    public var panPublisher: AnyPublisher<UIPanGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  @available(iOS 13.0, *)
  extension UIScreenEdgePanGestureRecognizer {
    /// A publisher which emits when this Screen Edge Gesture Recognizer is triggered
    public var screenEdgePanPublisher: AnyPublisher<UIScreenEdgePanGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  @available(iOS 13.0, *)
  extension UILongPressGestureRecognizer {
    /// A publisher which emits when this Long Press Recognizer is triggered
    public var longPressPublisher: AnyPublisher<UILongPressGestureRecognizer, Never> {
      gesturePublisher(for: self)
    }
  }

  // MARK: - Private Helpers

  // A private generic helper function which returns the provided
  // generic publisher whenever its specific event occurs.
  @available(iOS 13.0, *)
  private func gesturePublisher<Gesture: UIGestureRecognizer>(for gesture: Gesture) -> AnyPublisher<
    Gesture, Never
  > {
    Publishers.ControlTarget(
      control: gesture,
      addTargetAction: { gesture, target, action in
        gesture.addTarget(target, action: action)
      },
      removeTargetAction: { gesture, target, action in
        gesture?.removeTarget(target, action: action)
      }
    )
    .subscribe(on: DispatchQueue.main)
    .map { gesture }
    .eraseToAnyPublisher()
  }
#endif
