//
//  TextView+Menu.swift
//  AuroraEditorTextView
//
//  Created by Nanashi Li on 6/20/24.
//

import AppKit

extension TextView {
	/**
	 A computed property that returns an array of default menu items.
	 These items are always included at the end of the context menu.

	 - Returns: An array of MenuItemProvider objects representing Cut, Copy, and Paste actions.
	 */
	private var defaultMenuItems: [MenuItemProvider] {
		return [
			CustomMenuItem(title: "Cut", action: #selector(cut(_:)), keyEquivalent: "x"),
			CustomMenuItem(title: "Copy", action: #selector(copy(_:)), keyEquivalent: "c"),
			CustomMenuItem(title: "Paste", action: #selector(paste(_:)), keyEquivalent: "v"),
			CustomMenuItem(title: "Delete", action: nil, keyEquivalent: "d")
		]
	}

	/**
	 Creates and returns a menu for the TextView.
	 This method is called when the user right-clicks on the TextView or when a menu update is triggered.

	 - Parameter event: The NSEvent that triggered the menu creation, if applicable.
	 - Returns: An NSMenu object containing both custom and default menu items.
	 */
	private func createMenu(for event: NSEvent?) -> NSMenu {
		let menu = NSMenu()

		var menuItems: [MenuItemProvider] = []

		if let source = menuItemsSource {
			menuItems = source.menuItems(for: self)

			if !menuItems.isEmpty {
				menuItems.append(CustomMenuItem.separator())
			}
		}

		menuItems.append(contentsOf: defaultMenuItems)

		for item in menuItems {
			if item.isSeparator {
				menu.addItem(NSMenuItem.separator())
			} else {
				let menuItem = NSMenuItem(title: item.title,
										  action: item.action,
										  keyEquivalent: item.keyEquivalent)
				menu.addItem(menuItem)
			}
		}

		return menu
	}

	/**
	 Overrides the default menu creation for the TextView.
	 This method is called when the user right-clicks on the TextView.

	 - Parameter event: The NSEvent that triggered the menu creation.
	 - Returns: An NSMenu object containing both custom and default menu items, or nil if the event is not a right mouse click.
	 */
	override public func menu(for event: NSEvent) -> NSMenu? {
		guard event.type == .rightMouseDown else { return nil }
		return createMenu(for: event)
	}

	/**
	 Updates the context menu for the TextView.
	 This method can be called at any time to refresh the menu items.
	 */
	public func updateContextMenu() {
		self.menu = createMenu(for: nil)
	}
}
