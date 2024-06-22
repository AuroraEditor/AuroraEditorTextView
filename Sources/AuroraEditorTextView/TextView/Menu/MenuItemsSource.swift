//
//  MenuItemsSource.swift
//  
//
//  Created by Nanashi Li on 2024/06/21.
//

/// A source of menu items for a TextView.
///
/// Conform to this protocol to provide custom menu items for a TextView.
///
/// - Important: This protocol inherits from AnyObject, which means only class types can conform to it.
///
/// - Note: The implementing type is responsible for creating and returning an array of ``MenuItemProvider`` objects.
public protocol MenuItemsSource {
	/// Provides an array of menu items for the given TextView.
	///
	/// - Parameter textView: The TextView requesting the menu items.
	/// - Returns: An array of ``MenuItemProvider`` objects representing the menu items.
	func menuItems(for textView: TextView) -> [MenuItemProvider]
}
