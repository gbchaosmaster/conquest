# Conquest for GTK

This is a GUI wrapper for the Conquest tool. It displays the data in a window
rather than outputting to files, and has some buttons for copying that data
to the clipboard.

## Installation

Install with:

    gem install conquest-gtk

For proper clipboard functionality on Linux, make sure that you have
```xclip``` or ```xsel``` available.

## Usage

To run:

    conquest -g

It will download the data that it requires, then fire up the GUI ready to go.
