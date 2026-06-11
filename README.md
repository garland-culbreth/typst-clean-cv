# Clean CV template for Typst

A [typst](https://typst.app/) template for a clean curriculum vitae or resume.

![example preview](./thumbnail.png)

## Basic Usage

The easiest way to get started is to edit the template file. It contains examples of how to call each of the macros and fill them in with information.

As a simple example:

```typst
#import "/src/lib.typ": *

#show: clean_cv.with(
    name: "Your Name",
    location: "City, Country",
    phone: "+1 (123) 456-7890",
    email: "email@address.com",
    website: "website.com",
)

= Experience

#entry(
    title: "Position title",
    start: "20xx",
    end: "Present",
    organization: "Organization name",
    location: "City, Country",
)
#entry_bullet(lorem(30))

= Education

#entry(
    title: "PhD in Something",
    organization: "University of Somewhere",
    start: "20xx",
    end: "20xx",
    location: "City, Country",
)

= Projects

#project(
    name: "Project name",
    website: link(
        "https://website.com/",
        "project-website.com",
    ),
    start: "20xx",
    end: "",
)
#entry_bullet(lorem(10))
```

will produce a document with an experience section with one entry, an education section with one entry, and a projects section with one entry.

See also `templates/main.typ` for a more complete example.

### Publication list

A list of publications can be displayed using the `#publications` macro. You must supply a BibLaTeX `.bib` or Hayagriva `.yml` file containing the references to be cited, and all entries will be displayed in the order in which they appear in the file.
