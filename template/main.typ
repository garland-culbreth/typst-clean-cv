#import "/src/clean-cv.typ": *

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
        #entry_bullet(lorem(20))
        #entry_bullet(lorem(20))
        #entry_bullet(lorem(20))

        #entry(
            title: "Position title",
            start: "20xx",
            end: "20xx",
            organization: "Organization name",
            location: "City, Country",
        )
        #entry_bullet(lorem(20))
        #entry_bullet(lorem(20))
        #entry_bullet(lorem(20))

        #entry(
            title: "Position title",
            start: "20xx",
            end: "20xx",
            organization: "Organization name",
            location: "City, Country",
        )
        #entry_bullet(lorem(20))
        #entry_bullet(lorem(20))
        #entry_bullet(lorem(20))

        = Education

        #entry(
            title: "PhD in Something",
            organization: "University of Somewhere",
            start: "20xx",
            end: "20xx",
            location: "City, Country",
        )
        #entry(
            title: "MS in Something",
            organization: "University of Somewhere",
            start: "20xx",
            end: "20xx",
            location: "City, Country",
        )
        #entry(
            title: "BS in Something",
            organization: "University of Somewhere",
            start: "20xx",
            end: "20xx",
            location: "City, Country",
        )

        = Projects

        #entry_project(
            name: "Project name",
            website: link(
                "https://website.com/",
                "project-website.com",
            ),
            start: "20xx",
            end: "",
        )
        #entry_bullet[#lorem(15)]
        #entry_project(
            name: "Project name",
            website: link(
                "https://website.com/",
                "project-website.com",
            ),
            start: "20xx",
            end: "",
        )
        #entry_bullet[#lorem(15)]

        = Publications

        #publications("/template/citations.bib")
    ],
    right_content: [
        = Skills

        #skill("Skill one")
        #skill("Skill two")
        #skill("Skill three")
        #v(0.5em)
        #skill("Skill four")
        #skill("Skill five")
        #skill("Skill six")
        #v(0.5em)
        #skill("Skill seven")
        #skill("Skill eight")
        #skill("Skill nine")

        = Programming

        #skill_level(skill: "Rust", level: "X yrs")
        #skill_level(skill: "C++", level: "X yrs")

        = Awards

        #entry_one_column(
            title: "Award name",
            organization: "Organization name",
            start: "20xx",
            end: "",
            location: "",
        )
        #entry_one_column(
            title: "Award name",
            organization: "Organization name",
            start: "20xx",
            end: "",
            location: "",
        )

        = References

        #entry_reference(
            name: "Contact Name",
            position: "Position title",
            organization: "Organization",
            email: link("email@address.com", "email@address.com"),
            phone: "+1 (123) 456-7890",
        )
        #entry_reference(
            name: "Contact Name",
            position: "Position title",
            organization: "Organization",
            email: link("email@address.com", "email@address.com"),
            phone: "+1 (123) 456-7890",
        )
    ],
)
