//==========================================================
// Karlsruhe Institute of Technology theme for Typst slides.
// Based on the official Powerpoint Theme and Latex Template
//
// You don't need to edit this file. Only presentation.typ
// =========================================================
#import "@preview/polylux:0.3.1": *

#let _kit-outer-margin = 3mm
#let _kit-inner-margin = 11mm
#let _kit-top-margin = 10mm
#let _kit-bottom-margin = 11mm

#let kit-green = rgb(0, 150, 130)
#let kit-blue = rgb(70, 100, 170)
#let green = kit-green
#let blue = kit-blue
#let black70 = rgb(64, 64, 64)
#let brown = rgb(167, 130, 46)
#let purple = rgb(163, 16, 124)
#let cyan = rgb(35, 161, 224)
#let lime = rgb(140, 182, 60)
#let yellow = rgb(252, 229, 0)
#let orange = rgb(223, 155, 27)
#let red = rgb(162, 34, 35)

#let kit-title = state("kit-title", [])
#let kit-subtitle = state("kit-subtitle", [])
#let kit-short-title = state("kit-short-title", none)
#let kit-author = state("kit-author", [])
#let kit-short-author = state("kit-short-author", none)
#let kit-language = state("kit-language", "de")
#let kit-group-logo = state("kit-group-logo", none)
#let kit-institute = state("kit-institute", [])
#let kit-date = state("kit-date", none)

//=================
// Helper functions
//=================

#let kit-rounded-block(radius: 3mm, background: white, body) = {
    block(
        stroke: 0pt, // Workaround for https://github.com/typst/typst/issues/2533
        radius: (
            top-right: radius,
            bottom-left: radius,
        ),
        clip: true,
        body
    )
}

#let kit-theme(
    title: none,
    subtitle: none,
    short-title: none,
    author: none,
    short-author: none,
    language: "de",
    group-logo: none,
    institute: none,
    date: none,
    aspect-ratio: "16-9",
    body,
) = {

    if language not in ("en", "de") {
        panic("Only English (en) and German (de) are currently supported")
    }
    // Use power point page sizes, as they differ from default typst page sizes.
    set page(width: 25.4cm, height: 14.29cm, margin: 0pt) if aspect-ratio == "16-9"
    set page(width: 25.4cm, height: 15.88cm, margin: 0pt) if aspect-ratio == "16-10"
    set page(width: 25.4cm, height: 19.05cm, margin: 0pt) if aspect-ratio == "4-3"
    if aspect-ratio not in ("16-9", "16-10", "4-3") {
        panic("Unsupported aspect ratio")
    }

    set text(font: ("Arial", "Helvetica", "Roboto"))

    // The latex documentclass uses a size of 1ex, but type only supports em.
    set list(marker: align(horizon, rect(width: 0.5em, height: 0.5em, fill: kit-green, stroke: none, radius: (
        "top-right": 0.15em,
        "bottom-left": 0.15em,
    ))))

    kit-title.update(title)
    kit-subtitle.update(subtitle)
    if short-title == none {
        kit-short-title.update(title)
    } else {
        kit-short-title.update(short-title)
    }
    kit-author.update(author)
    if short-author == none {
        kit-short-author.update(author)
    } else {
        kit-short-author.update(short-author)
    }
    kit-language.update(language)
    kit-institute.update(institute)
    kit-group-logo.update(group-logo)
    kit-date.update(date)

    let testvar = [abcdefg]

    body
}

//=================
// slides
//=================

#let title-slide(banner: none) = {
    show: polylux-slide
    if banner == none {
        banner = "kit/banner.jpg"
    }

    // Top half
    pad(left: _kit-inner-margin, right: 6mm, top: _kit-top-margin)[
        // KIT logo
        #place[
          #locate(loc => {
              image("kit/logo-" + kit-language.at(loc) + ".svg", width: 45mm)
          })
        ]
        // Group logo
        #place(right)[
            #block(width: 30mm, height: 30mm)[
              #locate(loc => {
                  let group-logo = kit-group-logo.at(loc)
                  if group-logo != none [
                        #image(group-logo)
                  ]
              })
            ]
        ]
        // Title
        #place(dy: 32mm, text(weight: "bold", size: 26pt, kit-title.display()))
        // Subtitle
        #place(dy: 44mm)[
            #set text(weight: "bold", size: 18pt)
            #set par(leading: 0.3em)
            #kit-subtitle.display()
        ]
    ]

    // Bottom half
    align(bottom, pad(x: _kit-outer-margin)[
        // Banner
        #block(height: 60mm, below: 0pt)[
            #kit-rounded-block(radius: 3mm, image(banner, width: 100%, height: 100%))
        ]
        // Footer
        #block(height: _kit-bottom-margin, width: 100%)[
            #grid(columns: (auto, 1fr))[
                #align(left + horizon)[
                    #block(height: 100%)[
                        #set text(size: 8pt)
                        #locate(loc => {
                            let language = kit-language.at(loc)
                            if language == "en" [
                                #text(lang: "en")[KIT - The Research University in the Helmholtz Association]
                            ] else if language == "de" [
                                #text(lang: "de")[KIT - Die Forschungsuniversität in der Helmholtz-Gemeinschaft]
                            ]
                        })
                    ]
                ]
            ][
                #align(right + horizon, block(height: 100%)[
                    #link("https://www.kit.edu", text("www.kit.edu", weight: "bold", size: 16.5pt))
                ])
            ]
        ]
    ]
}

#let slide(title: [], body) = {
    show: polylux-slide
    set block(above: 0pt)
    // Title bar
    block(width: 100%, height: 22.5mm, inset: ("left": _kit-inner-margin, "right": _kit-inner-margin))[
       #grid(columns: (auto, 1fr))[
            #set text(24pt, weight: "bold")
            // We need a block here to force the grid to take the full height of the surrounding block
            #block(height: 100%)[
                #align(left + bottom, title)
            ]
        ][
            #align(right + bottom)[
                #locate(loc => {
                    image("kit/logo-" + kit-language.at(loc) + ".svg", width: 30mm)
                })
            ]
        ]
    ]
    v(15.5mm)
    // Content block
    block(inset: ("left": _kit-inner-margin, "right": _kit-inner-margin))[
        #set text(18pt)
        // Default value, but had to be changed for layout
        #set block(above: 1.2em)
        #body
    ]
    
    // Footer
    align(bottom, block(width: 100%, inset: ("left": _kit-outer-margin, "right": _kit-outer-margin))[
        #set block(above: 0pt)
        #set text(size: 9pt)
        #line(stroke: rgb("#d8d8d8"), length: 100%)
        #block(width: 100%, height: _kit-inner-margin)[
            #align(horizon)[
                #grid(columns: (20mm, 30mm, 1fr, auto))[
                    #pad(left: 6mm)[
                        // Workaround. See https://github.com/andreasKroepelin/polylux/issues/61#issuecomment-1654348478. Can be replaced with `logic.logical-slide.display() in the next polylux release.
                        #themes.simple.logic.logical-slide.display()
                    ]
                ][
                    #kit-date.display()
                ][
                    #kit-short-author.display() - #kit-short-title.display()
                ][
                    #align(right, kit-institute.display())
                ]
            ]
        ]
    ])
}

#let split-slide(title: [], body-left, body-right) = {
    let body = grid(columns: (1fr, 1fr), gutter: 2em, body-left, body-right)

    slide(title: title, body)
}

#let kit-color-block(title: [], color: [], body) = {
  // 80% is a rought heuristic, that produces the correct result for all predefined colors.
  // Might be adjusted in the future
  let title-color = if luma(color).components().at(0) >= 80% {
    black
  } else {
    white
  }
  kit-rounded-block(
  )[
    #block(
      width: 100%, 
      inset: (x: 0.5em, top: 0.3em, bottom: 0.4em), 
      fill: gradient.linear(
        (color, 0%), (color, 87%), (color.lighten(85%), 100%),
        dir: ttb
      ),
      text(fill: title-color, title)
    )
    #set text(size: 15pt)
    #block(inset: 0.5em , above: 0pt, fill: color.lighten(85%), width: 100%, body)
  ]
}

#let kit-info-block(title: [], body) = {
  kit-color-block(title: title, color: kit-green, body)
}

#let kit-example-block(title: [], body) = {
  kit-color-block(title: title, color: kit-blue, body)
}

#let kit-alert-block(title: [], body) = {
  kit-color-block(title: title, color: red.lighten(10%), body)
}

