//
//  MenuItemProvider.swift
//  
//
//  Created by Nanashi Li on 2024/06/21.
//

import ObjectiveC

/// Represents a single menu item in a context menu.
///
/// This protocol defines the essential properties of a menu item, including its title, action, 
/// key equivalent, and whether it's a separator.
public protocol MenuItemProvider {
	/// The title of the menu item.
	var title: String { get }

	/// The action to be performed when the menu item is selected.
	///
	/// - Note: This property is optional. If `nil`, the menu item will be disabled.
	var action: Selector? { get }

	/// The key equivalent for the menu item.
	///
	/// This is a string representing the keyboard shortcut for the menu item.
	/// For example, "cmd+c" for copy.
	var keyEquivalent: String { get }

	/// Indicates whether this item represents a separator in the menu.
	///
	/// If `true`, this item will be displayed as a separator line in the menu.
	var isSeparator: Bool { get }
}
