//
//  LivePreview.swift
//  ExperimentProject
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 08/12/20.
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13, *)
public extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    public func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}
#endif

