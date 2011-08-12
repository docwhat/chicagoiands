# Markdown Help

Hopefully this documentation is helpful. -- [Christian Holtje](http://docwhat.org)

## Headers:

Headers are marked with a `#` prefix.

Example:

    # this is a first level header

    ## this is a second level header

    ### this is a third level header

Output:

<div class="example" markdown="1">

# this is a first level header

## this is a second level header

### this is a third level header

</div>

## Emphasis

Markdown uses asterisks and underscores to indicate spans of emphasis.

Example:

    Some of these words *are emphasized*.
    Some of these words _are emphasized also_.

    Use two asterisks for **strong emphasis**.
    Or, if you prefer, __use two underscores instead__.

Output:

<div class="example" markdown="1">
 Some of these words *are emphasized*.
Some of these words _are emphasized also_.

Use two asterisks for **strong emphasis**.
Or, if you prefer, __use two underscores instead__.
</div>


## Lists ##

Unordered (bulleted) lists use asterisks, pluses, and hyphens (`*`,
`+`, and `-`) as list markers. These three markers are
interchangable.  Note, because of this, you may need to use `--` to
start a line with a dash ("--") character.

Example:

    *   Candy.
    *   Gum.
    *   Booze.

Output:

<div class="example" markdown="1">
-   Candy.
-   Gum.
-   Booze.
</div>

Ordered (numbered) lists use regular numbers, followed by periods, as
list markers.

Example:

    1.  Red
    2.  Green
    3.  Blue

Output:

<div class="example" markdown="1">
1.  Red
2.  Green
3.  Blue
</div>

If you put blank lines between items, you'll get `<p>` tags for the
list item text. You can create multi-paragraph list items by indenting
the paragraphs by 4 spaces or 1 tab:

    *   A list item.

        With multiple paragraphs.

    *   Another item in the list.

Output:


<div class="example" markdown="1">
*   A list item.

    With multiple paragraphs.

*   Another item in the list.
</div>


### Links ###

Markdown supports two styles for creating links: *inline* and
*reference*. With both styles, you use square brackets to delimit the
text you want to turn into a link.

Inline-style links use parentheses immediately after the link text.

Example:

    This is an [example link](http://example.com/).

Output:

<div class="example" markdown="1">
This is an [example link](http://example.com/).
</div>

Reference-style links allow you to refer to your links by names, which
you define elsewhere in your document:

    I get 10 times more traffic from [Google][1] than from
    [Yahoo][2] or [MSN][3].

    [1]: http://google.com/        "Google"
    [2]: http://search.yahoo.com/  "Yahoo Search"
    [3]: http://search.msn.com/    "MSN Search"

Output:

<div class="example" markdown="1">
I get 10 times more traffic from [Google][1] than from
[Yahoo][2] or [MSN][3].

[1]: http://google.com/        "Google"
[2]: http://search.yahoo.com/  "Yahoo Search"
[3]: http://search.msn.com/    "MSN Search"
</div>

The title attribute is optional. Link names may contain letters,
numbers and spaces, but are *not* case sensitive:

    I start my morning with a cup of coffee and
    [The New York Times][NY Times].

    [ny times]: http://www.nytimes.com/

Output:

<div class="example" markdown="1">
I start my morning with a cup of coffee and
[The New York Times][NY Times].

[ny times]: http://www.nytimes.com/

<p>I start my morning with a cup of coffee and
<a href="http://www.nytimes.com/">The New York Times</a>.</p>
</div>

### Images ###

Image syntax is very much like link syntax.

Example:

    ![Text describing the image](/assets/rails.png "An Optional Title")

Output:

<div class="example" markdown="1">
![Text describing the image](/assets/rails.png "An Optional Title")
</div>


## Blockquotes

If you're quoting something, then using blockquotes is really helpful.

Example:

    > Now is the time for all good men to come to.
    >
    > -- Pogo (Walt Kelly)

Output:

<div class="example" markdown="1">
> Now is the time for all good men to come to.
>
> -- Pogo (Walt Kelly)
</div>
