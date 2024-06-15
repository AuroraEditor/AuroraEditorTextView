/// This file is purely for helping in the transition from `AuroraEditorTextView` to `AuroraEditorSourceEditor`
/// The struct here is an empty view, and will be removed in a future release.

import SwiftUI

// swiftlint:disable:next line_length
@available(*,
			unavailable,
			renamed: "AuroraEditorSourceEditor",
			message: "AuroraEditorTextView has moved to https://github.com/AuroraEditor/AuroraEditorSourceEditor, please update any dependencies to use this new repository URL.")
struct AuroraEditorTextView: View {
    var body: some View {
        EmptyView()
    }
}
