# KIT Slides Theme for Typst

A Karlsruhe Institute of Technology theme for typesetting slides in Typst.

This theme uses [polylux](https://github.com/andreasKroepelin/polylux) for creating slides in Typst.
You can find more information on available functions in the [polylux book](polylux.dev/book).

The simplest way to use this template in the Typst web app is to first add this [read-only shared project](https://typst.app/project/rMlNud7c83Ybf0R2B9BBTt) to your account, then create a copy of it from your dashboard.


## Usage

Clone this repository, then use `presentation.typ` as a starting point for your presentation.

The theme is imported and loaded using
```typst
#import "kit-slides.typ": *

#show: kit-theme.with(
    title: [The title of your presentation],
    subtitle: [
        The subtitle of your presentation \
        Can contain two lines
    ],
    author: [Your name],
    short-title: [A short title to display at the bottom of all slides. Default to your title],
    group-logo: image("Path to the logo of your group"), // Optional
    date: [The date of the presentation],
    language: "de", // The language of the presentation. Supports "de" and "en".
    institute: [Your institute],
)
```

Next insert the title slide using
```typst
#title-slide(banner: image("Path to your banner image"))
```

Now you can add more slides using
```typst
#slide(title: [Your slide title])[
    Your slide content
]
```


## Compiling

We recommend using [pixi](https://pixi.sh) as a task and environment manager. You can however also use a regular typst installation.

### Using pixi

```bash
# compile once
pixi run compile
```

```bash
# watch for changes and recompile automatically
pixi run watch
```

Pixi also allows you to easily run different linters.
This template currently ships with `typos` to find typos and `typstyle` to format your typst code.
```bash
# run all linters
pixi run lint
```

### Using a local typst installation

```bash
# compile once
typst compile --font-path fonts/ thesis.typ
```

```bash
# watch for changes and recompile automatically
typst watch --font-path fonts/ thesis.typ
```

Make sure to not forget the `--font-path` argument as typst will otherwise silently use different fonts.


## Fonts

The KIT design guide requires using Arial (Windows) or Helvetica (MacOS) for office documents, including presentations. Because neither of those fonts is usually available on Linux machines this template ships with the free Roboto font to prevent typst from falling back to a serif font. Roboto is also approved by the KIT design guide, though only for web content, not office documents.
If you use this template in an official capacity it is recommended to install a copy of Arial on your system.


## Stability

This theme is still very new. I'll try to keep incompatible changes to a minimum, but can't promise that there won't be any incompatible changes.


## License

The source code of this theme, excluding files in the `kit/` and `fonts/Roboto/` directories, is licensed under the MIT license. See [LICENSE.txt](./LICENCE.txt) for details.

The "Karlsruhe Institute of Technology" logo in both German and English language is a protected word and figurative mark of the Karlsruhe Institute of Technology and must only be used in accordence with their usage policy.
