//
//  CustomMenuItem.swift
//  
//
//  Created by Nanashi Li on 2024/06/21.
//

import ObjectiveC

/// A concrete implementation of ``MenuItemProvider``.
///
/// This struct provides a convenient way to create menu items, including separators.
public struct CustomMenuItem: MenuItemProvider {
	/// The title of the menu item.
	public let title: String

	/// The action to be performed when the menu item is selected.
	public let action: Selector?

	/// The key equivalent for the menu item.
	public let keyEquivalent: String

	/// Indicates whether this item represents a separator in the menu.
	public let isSeparator: Bool

	/// Creates a new CustomMenuItem.
	///
	/// - Parameters:
	///   - title: The title of the menu item. Defaults to an empty string for separators.
	///   - action: The action to be performed when the menu item is selected. Defaults to `nil`.
	///   - keyEquivalent: The key equivalent for the menu item. Defaults to an empty string.
	///   - isSeparator: Whether this item should be a separator. Defaults to `false`.
	public init(title: String,
				action: Selector? = nil,
				keyEquivalent: String = "",
				isSeparator: Bool = false) {
		self.title = title
		self.action = action
		self.keyEquivalent = keyEquivalent
		self.isSeparator = isSeparator
	}

	/// Creates a separator menu item.
	///
	/// This is a convenience method for creating a separator menu item.
	///
	/// - Returns: A CustomMenuItem configured as a separator.
	public static func separator() -> CustomMenuItem {
		return CustomMenuItem(title: "", isSeparator: true)
	}
}
