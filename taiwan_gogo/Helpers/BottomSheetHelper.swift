//
//  BottomSheetHelper.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/13.
//

import SwiftUI

extension View {
    @ViewBuilder
    func bottomMaskForSheet(mask: Bool = true, height: CGFloat = 49) -> some View {
        self
            .background(SheetRootViewFinder(mask: mask, height: height))
    }
}

private struct SheetRootViewFinder: UIViewRepresentable {
    var mask: Bool
    var height: CGFloat

    func makeUIView(context: Context) -> UIView {
        return .init()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let rootView = uiView.viewBeforeWindow, let window = rootView.window {
                let safeArea = window.safeAreaInsets
                // Updating it's height so that it will create a empty space in the bottom
                rootView.frame = .init(
                    origin: .zero,
                    size: .init(
                        width: window.frame.width,
                        height: window.frame.height - (self.mask ? (self.height + safeArea.bottom) : 0)
                    )
                )

                rootView.clipsToBounds = true
                for view in rootView.subviews {
                    // Removing Shadows
                    view.layer.shadowColor = UIColor.clear.cgColor

                    if view.layer.animationKeys() != nil {
                        if let cornerRadiusView = view.allSubViews.first(where: { $0.layer.animationKeys()?.contains("cornerRadius") ?? false }) {
                            cornerRadiusView.layer.maskedCorners = []
                        }
                    }
                }
            }
        }
    }
}

private extension UIView {
    var viewBeforeWindow: UIView? {
        if let superview, superview is UIWindow {
            return self
        }
        return superview?.viewBeforeWindow
    }

    var allSubViews: [UIView] {
        return subviews.flatMap { [$0] + $0.subviews }
    }
}

#Preview {
    ContentView()
}
