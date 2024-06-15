<p align="center">
  <h1 align="center">AuroraEditorTextView</h1>
</p>

<p align="center">
  <a aria-label="Join the community on Discord" href="https://discord.gg/qmx4pByAVy" target="_blank">
    <img alt="" src="https://img.shields.io/badge/Join%20the%20community-black.svg?style=for-the-badge&logo=Discord">
  </a>
</p>

`AuroraEditorTextView` is a powerful text editor library for displaying and editing code documents in Swift. It provides a fast and efficient text view component that can handle large documents with ease. With customization options and support for syntax highlighting, AuroraEditorTextView is ideal for building code editors and IDEs.

> [!IMPORTANT]
> AuroraEditorTextView is designed for specific use cases where a specialized text view for displaying and editing lines of text is needed. It may not have feature parity with the system text view or support complex text layouts. If you require more advanced text editing capabilities or need to handle right-to-left text or custom layout elements, consider using alternatives like STTextView or NSTextView. For editing source code with features like indentation and syntax highlighting, check out the parent library AuroraEditorSourceEditor.

## Features

* Fast initial layout and rendering of large documents
* Basic text editing capabilities
* Customization options for code documents
* Support for syntax highlighting using styled strings
* Lightweight and performant

## Usage

Import the `AuroraEditorTextView` module in your Swift code:

``` swift 
import AuroraEditorTextView
```

Create an instance of `TextView` and configure it with the desired options:

```swift
let textView = TextView(
    string: "func helloWorld() {\n\tprint(\"hello world\")\n}",
    font: NSFont.systemFont(ofSize: 14),
    textColor: NSColor.textColor,
    lineHeightMultiplier: 1.0,
    wrapLines: true,
    isEditable: true,
    isSelectable: true,
    letterSpacing: 1.0,
    delegate: self
)
```

Embed the `TextView` in a scroll view or use it standalone:

```swift
let scrollView = NSScrollView()
scrollView.documentView = textView
```

Implement the `TextViewDelegate` protocol to handle events and customize the behavior of the text view.
For more detailed usage instructions and examples, please refer to the documentation.

## Contributing
Contributions to AuroraEditorTextView are welcome! If you find a bug, have a feature request, or want to contribute code, please open an issue or submit a pull request on the GitHub repository.

## License

Licensed under the [MIT license](https://github.com/AuroraEditorApp/AuroraEditor/blob/main/LICENSE.md).
