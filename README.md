# Clean CV template for Typst

A [typst](https://typst.app/) template for a clean curriculum vitae or resume.

![example preview](./thumbnail.png)

## Basic Usage

The easiest way to get started is to edit the template file. It contains examples of how to call each of the macros and fill them in with information.

### Filling columns

Content for each column is entered as normal within the `left_content` and `right_content` square-bracket `[]` contexts. For example, this snippet:

```typst
#import "/src/lib.typ": *

#show: clean_cv(
    name: "Your Name",
    location: "City, Country",
    phone: "+1 (123) 456-7890",
    email: link("mailto:email@address.com", "email@address.com"),
    website: link("https://website.com/", "website.com"),
    left_content: [
        = Experience

        #entry(
            title: "Position title",
            start: "20xx",
            end: "Present",
            organization: "Organization name",
            location: "City, Country",
        )
    ],
    right_content: [
        = Skills

        #skill("Skill one")
    ],
)
```

will produce a document with an experience section with one entry in the left column and a skills section with one skill in the right column.

See also `templates/main.typ` for a longer example.

### Publication list

A list of publications can be displayed using the `#publications` macro. You must supply a BibLaTeX `.bib` or Hayagriva `.yml` file containing the references to be cited, and all entries will be displayed in the order in which they appear in the file .
