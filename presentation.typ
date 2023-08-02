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
)

#title-slide(banner: "kit/banner.jpg")

#slide(title: [A slide title])[
    Some text: #lorem(20)

    A new paragraph with #text(fill: blue)[colored] text.
]


#split-slide(title: [A split slide])[
    A list

    - Item
    - Another item
    - A third item
][
    The right side.
    
    #lorem(40)
]

#slide(title: [Dynamic slides])[
  A fancy dynamic slide without a title.
  #uncover("2-")[This appears later!]
]

