#import "kit-slides.typ": *

#show: kit-theme.with(
  title: [A KIT Presentation],
  subtitle: [Created using Typst and kit-slides],
  author: [Adrian Freund],
  short-title: [A Kit Presentaion using Typst],
  // group-logo: "Path to your group's logo. Optional",
  date: [July 2023],
  language: "en",
  institute: [Private],
  show-page-count: false,
)

#title-slide(banner: "kit/banner.jpg")

#slide(title: [A slide title])[
  Some text: #lorem(20)

  A new paragraph with #text(fill: blue)[colored] text.
]

#slide(title: [A split slide])[
  #side-by-side[
    A list

    - Item
    - Another item
    - A third item
  ][
    The right side.

    #lorem(40)
  ]
]

#slide(title: [Dynamic slides])[
  A fancy dynamic slide.
  #uncover("2-")[This appears later!]
]

#slide(title: [Colored Blocks])[
  #set block(above: 0.8em) // Slightly reduce the block spacing, so we can fit 4 blocks on a page
  #kit-info-block(title: [Info Block])[
    - Green
  ]
  #kit-example-block(title: [Example Block])[
    - Blue
  ]
  #kit-alert-block(title: [Alert Block])[
    - Red
  ]
  #kit-color-block(title: [Custom Colors], color: yellow)[
    - Whatever you want
  ]
]
