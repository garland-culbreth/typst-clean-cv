/// Render a formatted name block. Used for the top left header.
///
/// - name (string): Your name.
/// - font_size (length | text.size): Size of the name text.
/// - text_color (color): Color to give the name text.
/// - pad_above (auto | fraction | length | relative): Space to insert or remove above the block. Useful for vertical alignment.
#let name_block(
    name: "Your name",
    font_size: 28pt,
    text_color: rgb("#002155"),
    pad_above: -4em,
) = {
    align(horizon)[
        #v(pad_above)
        #text(name, size: font_size, fill: text_color)
    ]
}

/// Render formatted contact information. Used for the top right header.
///
/// - location (string): Your location.
/// - phone (string): Your phone number.
/// - email (string): Your email address. Can be plain text or a `link()`.
/// - website (string): Your website URL. Can be plain text or a `link()`.
/// - pad_below_line (auto | fraction | length | relative): Space to insert below each line in the block.
/// - pad_above (auto | fraction | length | relative): Space to insert or remove above the block. Useful for vertical alignment.
#let contact_block(
    location: "City, Country",
    phone: "+1 (123) 456-7890",
    email: "email@address.com",
    website: "website.come",
    pad_below_line: 0.5em,
    pad_above: -4em,
) = {
    align(horizon)[
        #v(pad_above)
        #if (location != "") {
            block(below: pad_below_line)[
                #text(location)
            ]
        }
        #if (phone != "") {
            block(below: pad_below_line)[
                #text(phone)
            ]
        }
        #if (email != "") {
            block(below: pad_below_line)[
                #text(email)
            ]
        }
        #if (website != "") {
            block(below: pad_below_line)[
                #text(website)
            ]
        }
    ]
}

/// Render a formatted skill item.
///
/// - skill (string): Text to display as the skill item.
/// - pad_above (auto | fraction | length | relative): Space to insert above the skill item.
/// - pad_below (auto | fraction | length | relative): Space to insert below the skill item.
#let skill(
    skill,
    pad_above: 0em,
    pad_below: 0.5em,
) = {
    block(above: pad_above, below: pad_below)[#text(skill)]
}

/// Render a skill item with a level, such as years of experience.
///
/// - name (string): Skill name.
/// - level (string): Skill level. Often a unit of time.
/// - sep (string): Separator to display between name and level.
#let skill_level(
    skill: "Name",
    level: "1 yr",
    sep: "::",
) = {
    block(above: 0em, below: 0.5em)[
        #text(skill, weight: "bold")
        #text(sep, weight: "bold")
        #text(level, weight: "regular")
    ]
}

/// Render a formatted entry, such as a job position.
///
/// - start (string): Date on which you started with the position.
/// - end (string): Date on which you ended with the position.
/// - organization (string): Organization within which you held the position.
/// - location (string): Location from which you worked for the position.
/// - small_text_size (length | text.size): Size to give de-emphasized text elements.
/// - light_text_color (color): Color to give to de-emphasized text elements.
/// - pad_above (auto | fraction | length | relative): Space to insert above position block.
/// - pad_between (auto | fraction | length | relative): Space to insert between lines in position block.
/// - pad_below (auto | fraction | length | relative): Space to insert below position block.
#let entry(
    title: "Position title",
    start: "20xx",
    end: "20xx",
    organization: "Organization name",
    location: "City, country",
    small_text_size: 9pt,
    light_text_color: rgb("#393f46"),
    pad_above: 1.1em,
    pad_between: 0.5em,
    pad_below: 0.8em,
) = {
    if (start == "" and end != "") {
        panic(
            "If end date is defined start date must be defined. If you want only one date, use start.",
        )
    }
    let date_range = start + "–" + end
    block(above: pad_above)[
        #grid(
            columns: (1fr, auto),
            align: (left, right),
            text(title, weight: "bold"),
            if (start != "" and end != "") {
                text(date_range, weight: "regular")
            } else if (start != "" and end == "") {
                text(start, weight: "regular")
            },
        )
    ]
    block(above: pad_between, below: pad_below)[
        #grid(
            columns: (1fr, auto),
            align: (left, right),
            text(organization, weight: "regular", style: "italic"),
            text(location, style: "normal", size: small_text_size, fill: light_text_color),
        )
    ]
}

/// Render a formatted entry, such as a job position, in one column only.
///
/// - title (string): Title of your position.
/// - start (string): Date on which you started with the position.
/// - end (string): Date on which you ended with the position.
/// - organization (string): Organization within which you held the position.
/// - location (string): Location from which you worked for the position.
/// - small_text_size (length | text.size): Size to give de-emphasized text elements.
/// - light_text_color (color): Color to give de-emphasized text elements.
/// - pad_above (auto | fraction | length | relative): Space to insert above position block.
/// - pad_between (auto | fraction | length | relative): Space to insert between lines in position block.
/// - pad_below (auto | fraction | length | relative): Space to insert below position block.
#let entry_one_column(
    title: "Position title",
    start: "20xx",
    end: "20xx",
    organization: "Organization name",
    location: "City, country",
    small_text_size: 9pt,
    light_text_color: rgb("#393f46"),
    pad_above: 1.1em,
    pad_between: 0.5em,
    pad_below: 0.8em,
) = {
    if (start == "" and end != "") {
        panic(
            "If end date is defined start date must be defined. If you want only one date, use start.",
        )
    }
    let date_range = start + "–" + end
    block(above: pad_above)[#text(title, weight: "bold")]
    block(above: pad_between)[#text(organization, weight: "regular", style: "italic")]
    if (start != "" and end != "") {
        block(above: pad_between)[#text(date_range, weight: "regular", fill: light_text_color)]
    } else if (start != "" and end == "") {
        block(above: pad_between)[#text(start, weight: "regular", fill: light_text_color)]
    }
    if (location != "") {
        block(above: pad_between)[#text(location, style: "normal", size: small_text_size, fill: light_text_color)]
    }
}

/// Render a formattable bullet list item.
///
/// - item (string): Text to render as bullet point.
/// - font_size (text.size): Font size for bullet item text.
/// - text_color (color): Color for bullet item text.
/// - leading (length):  Line spacing of bullet item.
/// - pad_between (auto | fraction | length | relative): Space to insert between adjacent bullet points.
#let entry_bullet(
    item,
    font_size: 9pt,
    text_color: rgb("#393f46"),
    leading: 0.5em,
    pad_between: 0.6em,
) = {
    set text(style: "normal", size: font_size, fill: text_color)
    set par(leading: leading)
    block(below: pad_between)[#list(item)]
}

/// Render a formatted block for a project you've worked on.
///
/// - name (string): Name of project.
/// - start (string): Start date of project.
/// - end (string): End date of project.
/// - role (string): Role you have with project.
/// - website (string): Website of project.
/// - small_text_size (length | text.size): Size to give de-emphasized text elements.
/// - light_text_color (color): Color to use for de-emphasized text.
/// - pad_above (auto | fraction | length | relative): Space to insert above project block.
/// - pad_between_lines (auto | fraction | length | relative): Space to insert between lines in project block.
/// - pad_below (auto | fraction | length | relative): Space to insert below project block.
#let entry_project(
    name: "Position title",
    start: "20xx",
    end: "20xx",
    role: "Role name",
    website: "website.com",
    small_text_size: 9pt,
    light_text_color: rgb("#393f46"),
    pad_above: 1em,
    pad_between_lines: 0.5em,
    pad_below: 0.6em,
) = {
    if (start == "" and end != "") {
        panic(
            "If end date is defined start date must be defined. If you want only one date, use start.",
        )
    }
    let date_range = start + "–" + end
    block(above: pad_above, below: 0em)[
        #grid(
            columns: (1fr, auto),
            align: (left, right),
            text(name, weight: "bold"),
            if (start != "" and end != "") {
                text(date_range, weight: "regular")
            } else if (start != "" and end == "") {
                text(start, weight: "regular")
            },
        )
    ]
    block(above: pad_between_lines, below: pad_below)[
        #grid(
            columns: (1fr, auto),
            align: (left, right),
            text(role, weight: "regular"),
            text(website, style: "normal", size: small_text_size, fill: light_text_color),
        )
    ]
}

/// Render a formatted block for reference contact information.
///
/// - name (string): Name of reference contact.
/// - position (string): Position title of reference contact.
/// - organization (string): Organizational affiliation of reference contact.
/// - email (string): Email address of reference contact.
/// - phone (string): Phone number of reference contact.
/// - pad_between_lines (auto | fraction | length | relative): Space to insert between lines in the reference block.
/// - pad_below (auto | fraction | length | relative): Space to insert above reference block.
/// - small_text_size (length | text.size): Size to give de-emphasized text elements.
/// - light_text_color (color): Color to give de-emphasized text elements.
#let entry_reference(
    name: "Contact Name",
    position: "Position title",
    organization: "Organization",
    email: "email@address.com",
    phone: "+1 (123) 456-7890",
    pad_between_lines: 0.7em,
    pad_above: 1em,
    small_text_size: 9pt,
    light_text_color: rgb("#393f46"),
) = {
    block(above: pad_above, below: pad_between_lines)[#text(name)]
    block(below: pad_between_lines)[
        #text(organization, style: "italic", size: small_text_size)
    ]
    block(below: pad_between_lines)[
        #text(position, weight: "regular", size: small_text_size, fill: light_text_color)
    ]
    if (email != "") {
        block(below: pad_between_lines)[
            #text(email, weight: "regular", size: small_text_size)
        ]
    }
    if (phone != "") {
        block(below: pad_between_lines)[
            #text(phone, weight: "regular", size: small_text_size, fill: light_text_color)
        ]
    }
}

/// Render a formatted bibliography style list of publications
///
/// - file (string): File path to a BibLaTeX `.bib` or Hayagriva `.yml` file containing references to be cited. All entries will be displayed in the order they appear in the file.
/// - style (string): Bibliography style to display.
#let publications(file, style: "american-psychological-association") = {
    bibliography(file, full: true, title: none, style: style)
}

/// Render a simply styled clean looking CV.
///
/// - name (string): Your name.
/// - location (string): Your location.
/// - phone (string): Your phone number.
/// - email (string | link): Your email address. May be plain text or a `link()`.
/// - website (string | link): Your website URL. May be plain text or a `link()`.
/// - left_content (content): Content to display in the left main column.
/// - right_content (content): Content to display in the right main column.
/// - page_size (string): Page size.
/// - page_margin (length | margin): Page margin width.
/// - font_family (array | str | text.font): Font family for all text.
/// - main_font_size (length | text.size):Size of body text.
/// - heading_font_size (length | text.size): Size for section heading text.
/// - base_text_color (length | text.size): Color of basic text elements.
/// - heading_text_color (color): Color of section heading and name text.
/// - hyperlink_text_color (color): Color of hyperlinks.
/// - left_column_width (fraction): Width of the left column.
/// - right_column_width (fraction):  Width of the right column.
/// - column_gutter_width (array | auto | length | type): Width of the gutter between the left and right columns.
#let clean_cv(
    name: "Your Name",
    location: "City, Country",
    phone: "+1 (123) 456-7890",
    email: link("mailto:email@address.com", "email@address.com"),
    website: link("https://website.com", "website.com"),
    left_content: [],
    right_content: [],
    page_size: "us-letter",
    page_margin: 0.5in,
    font_family: "Fira Sans",
    main_font_size: 10pt,
    heading_font_size: 14pt,
    base_text_color: rgb("#1f2328"),
    heading_text_color: rgb("#002155"),
    hyperlink_text_color: rgb("#0969da"),
    left_column_width: 0.7fr,
    right_column_width: 0.3fr,
    column_gutter_width: 3em,
) = {
    set page(paper: page_size, margin: page_margin)
    set text(font: font_family, size: main_font_size, fill: base_text_color)
    show link: x => {
        set text(fill: hyperlink_text_color)
        underline(x)
    }
    show heading: title => [
        #set text(size: heading_font_size, weight: "regular", fill: heading_text_color)
        #block(smallcaps(title.body), above: 1.4em, below: 0.8em)
    ]
    grid(
        columns: (left_column_width, right_column_width),
        rows: (5em, auto),
        column-gutter: column_gutter_width,
        name_block(name: name),
        contact_block(
            location: location,
            phone: phone,
            email: email,
            website: website,
        ),

        left_content, right_content,
    )
}
