# Codecademy Intro to HTML notes

>HTML is composed of elements. These elements structure the webpage and define its content. Let's take a look at how they're written.

>The diagram to the right displays an HTML paragraph element. As we can see, the paragraph element is made up of one opening tag (`<p>`), the content (“Hello World!” text), and a closing tag (`</p>`). A tag and the content between it is called an HTML element. There are many tags that we can use to organize and display text and other types of content, like images

### Hierachy

- Child elements are elements nested in a parent element, e.g. `<body><p>this is a child</p></body>`
- Since there can be multiple levels of nesting, this analogy can be extended to grandchildren, great-grandchildren, and beyond. The relationship between elements and their ancestor and descendent elements is known as *hierarchy*.
- Use two spacebars of indentation to indicate hierachy (instead of usual tab distance). e.g.
```html 
<body>
  <h1>Hello World</h1>

  <div>
    <p>This paragraph is a child of the div element and a grandchild of the body element</p>

  </div>  
</body>
```


### `<Body>` tag
>One of the key HTML elements we use to build a webpage is the body element. Only content inside the opening and closing body tags can be displayed to the screen. Here's what opening and closing body tags look like:

```html
<body>

</body>
```

>Once the file has a body, many different types of content – including text, images, and buttons – can be added to the body.

```html
<body>
  <p>What's up, doc?</p>
</body>
```

### `<head>` tag

>Remember the <body> tag? The <head> element is part of this HTML metaphor. It goes above our <body> element.
The <head> element contains the metadata for a web page. Metadata is information about the page that isn't displayed directly on the web page. Unlike the information inside of the <body> tag, the metadata in the head is information about the page itself.
The opening and closing head tags typically appear as the first item after your first HTML tag:

```html
<head>
</head>
```
A browser's tab displays the title specified in the `<title>` tag. The `<title>` tag is always inside of the `<head>`.

### `<div>` tag
>One of the most popular elements in HTML is the `<div>` element. `<div>` is short for "division" or a container that divides the page into sections. These sections are very useful for grouping elements in your HTML together.
`<div>`s can contain any text or other HTML elements, such as links, images, or videos. Remember to always add two spaces of indentation when you nest elements inside of `<div>`s for better readability.

```html
<body>
  <div>
    <h1>Why use divs?</h1>
    <p>Great for grouping elements!</p>
  </div>
</body>
```


### Attributes

>Attributes are content added to the opening tag of an element and can be used in several different ways, from providing information to changing styling. Attributes are made up of the following two parts:
-The name of the attribute
-The value of the attribute

##### Example using `id`
>One commonly used attribute is the id. We can use the id attribute to specify different content (such as `<div>`s) and is really helpful when you use an element more than once. ids have several different purposes in HTML, but for now, we'll focus on how they can help us identify content on our page.

>When we add an id to a `<div>`, we place it in the opening tag:

```html
<div id="intro">
  <h1>Introduction</h1>
</div>
```
### The `<img>` tag

>The `<img>` tag allows you to add an image to a web page. Most elements require both opening and closing tags, but the `<img>` tag is a self-closing tag. Note that the end of the `<img>` tag has a forward slash /. Self-closing tags may include or omit the final slash — both will render properly.
```html
<img src="image-location.jpg" />
```
>The `<img>` tag has a required attribute called `src`. The src attribute must be set to the image's source, or the location of the image. In this case, the value of src must be the uniform resource locator (URL) of the image. A URL is the web address or local address where a file is stored.

#### Image `alt` attribute
>The alt attribute, which means alternative text, brings meaning to the images on our sites. The alt attribute can be added to the image tag just like the src attribute. The value of alt should be a description of the image.
```html
<img src="#" alt="A field of yellow sunflowers" />
```
>The alt attribute also serves the following purposes:
-If an image fails to load on a web page, a user can mouse over the area originally intended for the image and read a brief description of the image. This is made possible by the description you provide in the alt attribute.
-Visually impaired users often browse the web with the aid of screen reading software. When you include the alt attribute, the screen reading software can read the image's description out loud to the visually impaired user.
-The alt attribute also plays a role in Search Engine Optimization (SEO), because search engines cannot "see" the images on websites as they crawl the internet. Having descriptive alt attributes can improve the ranking of your site.
If the image on the web page is not one that conveys any meaningful information to a user (visually impaired or otherwise), the alt attribute should be left empty.

### The `<video>` tag

>Like the <img> tag, the <video> tag requires a src attribute with a link to the video source. Unlike the <img> tag however, the <video> element requires an opening and a closing tag.

```html
<video src="myVideo.mp4" width="320" height="240" controls>
  Video not supported
</video>
```
>In this example, the video source (src) is myVideo.mp4 The source can be a video file that is hosted alongside your webpage, or a URL that points to a video file hosted on another webpage.

>After the src attribute, the width and height attributes are used to set the size of the video displayed in the browser. The controls attribute instructs the browser to include basic video controls: pause, play and skip.

>The text, "Video not supported", between the opening and closing video tags will only be displayed if the browser is unable to load the video.

### The `<html>` tag
>The `<!DOCTYPE html>` declaration provides the browser with two pieces of information (the type of document and the HTML version to expect), but it doesn't actually add any HTML structure or content.

>To create HTML structure and content, we must add opening and closing <html> tags after declaring <!DOCTYPE html>:

```html
<!DOCTYPE html>
<html>

</html>
```
>Anything between the opening <html> and closing </html> tags will be interpreted as HTML code. Without these tags, it's possible that browsers could incorrectly interpret your HTML code.

### The anchor, `<a>` tag

```html
<a href="https://www.wikipedia.org/" target="_blank">This Is A Link To Wikipedia</a>
```
-*a* stands for **anchor**
-*href* stands for **hyperlink refference** 
-`target` is an optional attribute which opens the link in a new window or tab

##### Internal linking

>Before we learn how to link between internal pages, let's establish where our files are stored. When making multi-page static websites, web developers often store HTML files in the root directory, or a main folder where all the files for the project are stored. As the size of the projects you create grows, you may use additional folders within the main project folder to organize your code.
project-folder/
|—— about.html
|—— contact.html
|—— index.html
The example above shows three different files — about.html, contact.html, and index.html in one folder.
HTML files are often stored in the same folder, as shown in the example above. If the browser is currently displaying index.html, it also knows that about.html and contact.html are in the same folder. Because the files are stored in the same folder, we can link web pages together using a relative path.

`<a href="./contact.html">Contact</a>`

>In this example, the <a> tag is used with a relative path to link from the current HTML file to the contact.html file in the same folder. On the web page, Contact will appear as a link.

>A relative path is a filename that shows the path to a local file (a file on the same website, such as `./index.html`) versus an absolute path (a full URL, like `https://www.codecademy.com/learn/learn-html` which is stored in a different folder). The `./` in `./index.html` tells the browser to look for the file in the current folder.

##### Linking to parts of the same page
Use `href="#target_id"` for linking to an element with `id="target_id"` to enable linking to various parts of the same page.

##### Converting elements into links

>So far, we've added links that were made up of only text, like the following:
```html
<a href="https://en.wikipedia.org/wiki/Opuntia" target="_blank">Prickly Pear</a>
```

>HTML allows you to turn nearly any element into a link by wrapping that element with an anchor element. With this technique, it's possible to turn images into links by simply wrapping the <img> element with an <a> element.

```html
<a href="https://en.wikipedia.org/wiki/Opuntia" target="_blank"><img src="#" alt="A red prickly pear fruit"/></a>
```
>In the example above, an image of a prickly pear has been turned into a link by wrapping the outside of the <img> element with an <a> element.


## Cheat sheet
```html
displating text:
<!DOCTYPE html> - indicates that the document is an html document.

standardized indentation is 2 spaces for anything inside an element.

<!-- This is a comment that the browser will not display. -->

<h1> — used for main headings. All other smaller headings are used for subheadings.
<h2>
<h3>
<h4>
<h5>
<h6>

<p> contain a block of plain text.
<span> contains short pieces of text or other HTML. 
They are used to separate small pieces of content 
that are on the same line as other content.

unordered lists:
<ul>
  <li>Limes</li>
  <li>Tortillas</li>
  <li>Chicken</li>
</ul>

ordered lists:
<ol>
  <li>Limes</li>
  <li>Tortillas</li>
  <li>Chicken</li>
</ol>

<em></em> italics
<strong></strong> bold
<br> line break
```
```html
<a></a> - an anchor element for making hyperlinks.
<a href="somurl">link text</a>
```