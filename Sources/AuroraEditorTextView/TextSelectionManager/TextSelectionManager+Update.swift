//
//  TextSelectionManager+Update.swift
//  AuroraEditorTextView
//
//  Created by Khan Winter on 10/22/23.
//

import Foundation

extension TextSelectionManager {
	/// Updates text selections based on the characters replaced in the text storage.
	///
	/// This method adjusts the location and length of text selections in response to a replacement 
	/// of characters within a specified range. It handles various cases, such as deletions, insertions,
	/// and overlapping selections. After updating the selections, it also removes any duplicate selection ranges.
	///
	/// - Parameters:
	///   - range: The range in the original text storage where the replacement occurs.
	///   - replacementLength: The length of the replacement text. A length of 0 indicates a deletion.
    public func didReplaceCharacters(in range: NSRange, replacementLength: Int) {
        let delta = replacementLength == 0 ? -range.length : replacementLength
        for textSelection in self.textSelections {
            if textSelection.range.location > range.max {
				// Case 1: Selection starts after the replacement range
                textSelection.range.location = max(0, textSelection.range.location + delta)
                textSelection.range.length = 0
            } else if textSelection.range.intersection(range) != nil
                        || textSelection.range == range
                        || (textSelection.range.isEmpty && textSelection.range.location == range.max) {
				// Case 2: Selection intersects with the replacement range
                if replacementLength > 0 {
                    textSelection.range.location = range.location + replacementLength
                } else {
                    textSelection.range.location = range.location
                }
                textSelection.range.length = 0
            } else {
                textSelection.range.length = 0
            }
        }

        // Clean up duplicate selection ranges
        var allRanges: Set<NSRange> = []
        for (idx, selection) in self.textSelections.enumerated().reversed() {
            if allRanges.contains(selection.range) {
                self.textSelections.remove(at: idx)
            } else {
                allRanges.insert(selection.range)
            }
        }
    }

	/// Notifies observers about changes to the text selection and updates selection views.
	///
	/// This method is called after text editing operations to ensure the UI and any observers are updated 
	/// accordingly. It updates the selection views and posts a notification indicating that the text selection has changed.
    func notifyAfterEdit() {
        updateSelectionViews()
        NotificationCenter.default.post(Notification(name: Self.selectionChangedNotification, object: self))
    }
}
