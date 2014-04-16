AutoLayoutForUITableViewCell
============================

iPhone UITableView with Auto Layout in the UITableViewCell to Create Dynamic Heights

This code is from my video tutorial on how to setup Auto Layout for UITableViewCell objects in iOS 7.

There's some gotchas (lots) to get things working.

Video: [https://www.youtube.com/watch?v=6KImie4ZMwk](https://www.youtube.com/watch?v=6KImie4ZMwk)

The content is a few quotes from Steve Jobs and they can take up more or less vertical space. The type of font also changes the height for the cells. Note: To make it work in landscape, make sure you add constraints between the UIView and the UITableView if you embed the UITableView in your Storboard or .xib file.

![iPhone Auto Layout in UITableViewCell in Landscape](https://raw.githubusercontent.com/PaulSolt/AutoLayoutForUITableViewCell/master/Landscape%20UITableViewCell%20Auto%20Layout.png)

![iPhone Auto Layout in UITableViewCell in Portrait](https://raw.githubusercontent.com/PaulSolt/AutoLayoutForUITableViewCell/master/Portait%20UITableViewCell%20Auto%20Layout.png)
