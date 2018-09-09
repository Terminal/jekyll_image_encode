# Jekyll Image Encode

_[is a fork of another project](https://github.com/GSI/jekyll_image_encode)_

This Jekyll plugin fetches images from the web and renders their corresponding base64 codes.

For example, a **1x1 clear PNG** would become:

```html
<img src="data:image;base64, iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAAXNSR0IArs4c6QAAAAxJREFUCNdj+P//PwAF/gL+3MxZ5wAAAABJRU5ErkJggg== " />
```

Be sure to know your reasons when using this plugin.

## Installation
Dunno.
I don't Ruby.
This is a bodge to allow defaults, and also to grab data from the page

## Usage

This grabs `page.data.avatar`, and if the URL doesn't exist, defaults to `/assets/images/logo.png`, relative to the Jekyll

```xml
<img href="{% base64 data.avatar;/assets/images/logo.png %}" />
```
