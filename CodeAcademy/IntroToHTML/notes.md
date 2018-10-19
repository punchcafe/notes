#Codecademy Intro to HTML notes

>HTML is composed of elements. These elements structure the webpage and define its content. Let's take a look at how they're written.

>The diagram to the right displays an HTML paragraph element. As we can see, the paragraph element is made up of one opening tag (<p>), the content (“Hello World!” text), and a closing tag (</p>). A tag and the content between it is called an HTML element. There are many tags that we can use to organize and display text and other types of content, like images

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
### `<div>` tag
>One of the most popular elements in HTML is the <div> element. <div> is short for "division" or a container that divides the page into sections. These sections are very useful for grouping elements in your HTML together.
<div>s can contain any text or other HTML elements, such as links, images, or videos. Remember to always add two spaces of indentation when you nest elements inside of <div>s for better readability.
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

#### Example using `id`
>One commonly used attribute is the id. We can use the id attribute to specify different content (such as <div>s) and is really helpful when you use an element more than once. ids have several different purposes in HTML, but for now, we'll focus on how they can help us identify content on our page.

>When we add an id to a <div>, we place it in the opening tag:
```html
<div id="intro">
  <h1>Introduction</h1>
</div>
```
### `img` tag

>The <img> tag allows you to add an image to a web page. Most elements require both opening and closing tags, but the <img> tag is a self-closing tag. Note that the end of the <img> tag has a forward slash /. Self-closing tags may include or omit the final slash — both will render properly.
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

### `video` tag

>Like the <img> tag, the <video> tag requires a src attribute with a link to the video source. Unlike the <img> tag however, the <video> element requires an opening and a closing tag.

```html
<video src="myVideo.mp4" width="320" height="240" controls>
  Video not supported
</video>
```
>In this example, the video source (src) is myVideo.mp4 The source can be a video file that is hosted alongside your webpage, or a URL that points to a video file hosted on another webpage.

>After the src attribute, the width and height attributes are used to set the size of the video displayed in the browser. The controls attribute instructs the browser to include basic video controls: pause, play and skip.

>The text, "Video not supported", between the opening and closing video tags will only be displayed if the browser is unable to load the video.


## Cheat sheet
```html
displating text:

<h1> — used for main headings. All other smaller headings are used for subheadings.
<h2>
<h3>
<h4>
<h5>
<h6>

<p> contain a block of plain text.
<span> contains short pieces of text or other HTML. They are used to separate small pieces of content that are on the same line as other content.

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