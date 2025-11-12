#import "FieldGuide.typ": *


#let title = "Field Guide to Field Guides"
#let author = "Tetragramm"

#show: Lancer.with(
  Title: title,
  Author: author,
  CoverImg: none,
  Description: "Typst Template",
  Dedication: [
    #CC.Threat, #CC.Armor, #text(font: "Ubuntu Mono")[Testing Font], Look strange? You probably don't have the fonts
    installed.

    Download the fonts from #link("https://github.com/Tetragramm/lancer-field-guide-typst/archive/refs/tags/Font.zip")[HERE].
    Install them on your computer, upload them to the Typst web-app (anywhere in the project is fine) or use the Typst
    command line option --font-path to include them.
  ],
)

#let lcp = ImportLCP(
  "./LCP",
  actions: true,
  backgrounds: true,
  core_bonuses: true,
  environments: true,
  frames: true,
  manufacturers: true,
  mods: true,
  pilot_gear: true,
  reserves: true,
  sitreps: true,
  skills: true,
  statuses: true,
  systems: true,
  talents: true,
  weapons: true,
)

// #let lcpls = ImportLCP(
//   "./LCP-LS",
//   core_bonuses: true,
//   frames: true,
//   manufacturers: true,
//   mods: true,
//   systems: true,
//   weapons: true,
//   npc_classes: true,
//   npc_features: true,
//   npc_templates: true,
// )

#Section(
  "INTRODUCTION TO THE FIELD GUIDE",
  img: (image("images/Stanford_L.jpg"), image("images/Stanford_R.jpg")),
)

#show link: it => {
  set text(fill: blue)
  underline(it)
}

#show ref: it => {
  set text(fill: blue)
  underline(it)
}

== First Questions
This document is produced using, and describes how to use, the Lancer Field Guide package for Typst. It makes it simple
to create a document in the format of the official Lancer content.

It's important to know that Typst is a text markup language that gets compiled to PDF, SVG, or PNG files. It's very like
a programming language. However, this package, hides as much of the complexity as possible.

=== Why Typst?
First of all, Typst is free, both in the money sense, and in the information sense. You can download it on pretty much
any computer and use it.

Second, unlike LaTeX, Typst is modern, and very easy to use. Where LaTeX is 40 years old, and it shows, Typst is much
newer, and based on a much more modern understanding of programming languages. It has native understanding of things
like numbers, and json files, which allows some features that the LaTeX template doesn't have, such as parsing LCP files
directly into the document. It is also faster. Much faster.

Typst is capable of doing amazing things when formatting text. You'll see some of that below. I hope this template will
be useful to you and help you make better Lancer content, without worrying about graphic design.

=== First Steps
There are two ways of using typst: Building it yourself or using the web service. The web-service can be found at #link("https://typst.app").
The instructions to install it on your computer can be found at #link("https://github.com/typst/typst?tab=readme-ov-file#installation")

Either way, you need to download the template files from the itch.io page, and//TODO:Link here
make sure that the file `Field Guide to Field Guides.typ` compiles properly. Online you copy all the files, images, and
fonts into the workspace, and open up the ".typ" file. You'll notice the title page has several fonts used in the sample
file so you can verify that it's working. Local users will need to either install the fonts, or use the `--font-path` CLI
variable, then run `typst compile 'Field Guide to Field Guides.typ'` or `typst watch ...` if you want it to re-compile
every time you save changes.

=== ABOUT THE TEMPLATE
The template is in two parts. Most important is the file
``` FieldGuide.typ```, which defines a lot of useful commands, symbols, and formatting. Second is the file #NoKeyword()[`Main.typ`],
which sets up the skeleton that you will be filling out. Here is the full text of #NoKeyword()[`Main.typ`], and we'll
use this to explain what it does, then we'll get into what ``` FieldGuide.typ``` provides.

```typ
#import "FieldGuide.typ": *
#show: Lancer.with(
  Title: "My Title",
  Author: "My Name",
  CoverImg: none,//image("images/Cover.jpg"),
  Description: "Field Guide to My Thing",
  Dedication: [],
)

//Your stuff goes here
```

That's it! Set your title, author name (or names), a description, and a dedication, all of which get placed onto the
title page, and into the PDF metadata as appropriate. Then you can start adding content below.

=== Basic formatting
Typst is very simple to use. It uses the conventions of markdown where possible. `*Word*` is *word*, `_word_` is _word_ and
use `-` for bulleted lists. You can check out all the documentation on the website: #link("https://typst.app/docs/reference/syntax/")

Next, we'll cover the advanced formatting that this template provides.

== Lancer Formatting

First, how to include images. To have a full-page image, no borders, no page numbers, just a pure image, the easiest way
is to do this:

```typ #FullPageImage(image("images/JWST-Jupiter.png"))```

If instead you want to keep the page numbers, section names, ect, you can use

```typ #FullPageImageFramed(image("images/FullPageImg.png", fit:"stretch", width:100%))```

As you can see, you can use standard typst manipulations of the image to change to it fits, covers the page, and so
forth.

You can also reference the image from elsewhere as a clickable link, and optionally pass the `refname` parameter to
change how it is displayed in a reference. It will default to the sequential number of the image, counting from the
start of the document. As an example, a reference to the end of the sub-section is #ref(label("images/FullPageImg.png")).
Created with ```typ #ref(label("images/FullPageImg.png"))``` or you can use `#link` to set custom display text, like so: ```typ #link(label("images/BottomRight.png"), "Next Page")```

The image itself is created like so:
```typ
#FullPageImageFramed(image("images/FullPageImg.png", fit:"stretch", width:100%), refname:"Demonstration Full Page Image")```
The reference link is created like so:

```typ #ref(label("images/FullPageImg.png"))```

There's also a helper function for single-column images.

```typ #FullColImage(image("images/FullCol.png"))```

If you want to place an image in a column, or across the top or bottom of a page, just use the built-in feature, `figure`.
Though you do have to manually add the label to reference it.

```typ #figure(placement:bottom, scope: "parent", image("images/BottomHalf.png")) #label("images/BottomHalf.png") ```

and

```typ #figure(image("images/BottomRight.png")) #label("images/BottomRight.png")```

(See it on the #link(label("images/BottomRight.png"), "Next Page"))

#figure(placement: bottom, scope: "parent", image("images/BottomHalf.png"))


#figure(image("images/BottomRight.png")) #label("images/BottomRight.png")



#LoreBox[
  LORE BOX

  This is what is called a "Lore Box", because that's how it's used in the core book.

  If you want to have a new paragraph without the leading space, even though it's harder to read, remember to use the \\
  character followed by a new line, instead of two new lines.\
  Looks like this.
]


A Lore Box is created as\
```typ #LoreBox[Your text here]```

#ContentBox(
  clr: red,
  clip: "top-right",
  txt: [
    This is a content box. The Core Book uses these to give mechanics examples. It's also a component of most of the other
    box types.

    ```typ #ContentBox(clr:red, clip:"top-right", txt:[Your text here])```

    The valid values for clip are `"top-right"` and `"bottom-right"`, and clr is any valid color, which will be
    automatically lightened for the background of the box.
  ],
)

There are a series of other Box types. Each of them represents a different type of system, weapon, or action. There is
the base function\
```typ #Infobox(clr:color, title:none, title_tech:none, body:none, flavor_text:none, drawing:none)```

and interfaces that specify the color and drawing variables named ```typ #WeaponBox, #ProtocolBox, #ActionBox, #PassiveBox, #ReactionBox, and #GearBox```.

You can create your own pattern to draw in the corner, if you need one. It uses the cetz drawing canvas, and is
automatically scaled so that things drawn in a 1x1 box fit nicely. This is the one used for the TechBox.
```typ
#let drawing = {
    import cetz.draw: *
    rect((0,0),(0.5,0.5))
    rect((0.5,0.5),(0.8,0.8))
    rect((0.8,0.8),(1,1))
  }
```

```typ
#TechBox(title:[Tech Box], title_tech:[An Action?], body:[
  This is the first body text.

  #BoxInset(clr:narrativepurple)[This is how you make an inset.]

  Bottom Body Text.
], flavor_text: [
  This is the flavor text.
])
```

#TechBox(
  title: [Tech Box],
  title_tech: [An Action?],
  body: [
    This is the first body text.

    #BoxInset(clr: narrativepurple)[This is how you make an inset.]

    Bottom Body Text.
  ],
  flavor_text: [
    This is the flavor text. All of the body, the flavor_text, and the title_tech are optional.
  ],
)

The colors defined by this template are:
- lightestred: #box(fill: lightestred, width: 1em, height: 0.8em)
- cherryred: #box(fill: cherryred, width: 1em, height: 0.8em)
- red: #box(fill: red, width: 1em, height: 0.8em)
- deepred: #box(fill: deepred, width: 1em, height: 0.8em)
- darkred: #box(fill: darkred, width: 1em, height: 0.8em)
- darkerred: #box(fill: darkerred, width: 1em, height: 0.8em)
- darkestred: #box(fill: darkestred, width: 1em, height: 0.8em)
- tablegrey: #box(fill: tablegrey, width: 1em, height: 0.8em)
- gearbrown: #box(fill: gearbrown, width: 1em, height: 0.8em)
- downtimetan: #box(fill: downtimetan, width: 1em, height: 0.8em)
- combatcharcoal: #box(fill: combatcharcoal, width: 1em, height: 0.8em)
- downtimetan: #box(fill: downtimetan, width: 1em, height: 0.8em)
- weaponblack: #box(fill: weaponblack, width: 1em, height: 0.8em)
- protocolorange: #box(fill: protocolorange, width: 1em, height: 0.8em)
- actiongreen: #box(fill: actiongreen, width: 1em, height: 0.8em)
- reactionteal: #box(fill: reactionteal, width: 1em, height: 0.8em)
- talentblue: #box(fill: talentblue, width: 1em, height: 0.8em)
- techactionplum: #box(fill: techactionplum, width: 1em, height: 0.8em)
- narrativepurple: #box(fill: narrativepurple, width: 1em, height: 0.8em)

Making a table in the style of the Lancer book also uses a function.\
```typ #LancerTable(title:str, instructions:str, fill_function: calc.odd, ..tableargs)```\
Title and instructions make the text at the top of the table, and the rest is standard typst table arguments. So define
the columns, pass the cells, ect.

```typ #LancerTable(title:"Title", instructions:"Instructions", columns:(auto,1fr),
[*0*], [Table Value],
[*1*], [Table Value],
)```
Produces this:\
// @typstyle off
#LancerTable(
  title: "Title",
  instructions: "Instructions",
  columns: (auto, 1fr),
  [*0*], [Table Value],
  [*1*], [Table Value],
)

#figure(
  placement: top,
  scope: "parent",
  // @typstyle off
  LancerTable(
    title: "Level Chart",
    instructions: "",
    columns: (auto, auto, 2fr, 1fr, 1fr, 1fr, 2fr),
    table.vline(x: 2, stroke: white + 3pt),
    LancerHeaderCell[LL],
    LancerHeaderCell[Grit],
    LancerHeaderCell[Total Mech Skill Points (+6 MAX)],
    LancerHeaderCell[TOTAL LICENSE RANKS],
    LancerHeaderCell[TOTAL TALENT RANKS],
    LancerHeaderCell[TOTAL CORE BONUSES],
    LancerHeaderCell[TOTAL PILOT TRIGGER POINTS (+6 MAX)],
    [*0*],[0],[2],[0],[3],[0],[8],
    [*1*],[1],[3],[1],[4],[0],[10],
    [*2*],[1],[4],[2],[5],[0],[12],
    [*3*],[2],[5],[3],[6],[1],[14],
    [*4*],[2],[6],[4],[7],[1],[16],
    [*5*],[3],[7],[5],[8],[1],[18],
    [*6*],[3],[8],[6],[9],[2],[20],
    [*7*],[4],[9],[7],[10],[2],[22],
    [*8*],[4],[10],[8],[11],[2],[24],
    [*9*],[5],[11],[9],[12],[3],[26],
    [*10*],[5],[12],[10],[13],[3],[28],
    [*11*],[6],[13],[11],[14],[3],[30],
    [*12*],[6],[14],[12],[15],[4],[32],
  ),
)

You can use figure to put the table across the top or bottom of a page, and the utility ```typ #LancerHeaderCell``` to
make headers like the table above.

That is created with the code:\
```typ
#figure(placement:top, scope: "parent",
LancerTable(title:"Level Chart", instructions: "",
  columns:(auto, auto, 2fr, 1fr, 1fr, 1fr, 2fr),
  table.vline(x:2, stroke:white+3pt),
  LancerHeaderCell()[LL],
  <snip>,
  LancerHeaderCell()[TOTAL PILOT TRIGGER POINTS (+6 MAX)],
  [*0*], [0], [2], [0], [3], [0], [8],
  <snip>
  )
)
```
The `table.vline` is used to draw the white line before column two.

Lastly, there is another type of box, used primarily for the traits of mechs.

```typ #TraitBox(title:[Title])[Text goes here.]```

#TraitBox(title: [Title])[
  Text goes here.
]

#colbreak()
The last bit of random formatting you need to be aware of is how to create the facing chapter pages.
```typ
#Section("INTRODUCTION TO THE FIELD GUIDE",
  img:(
    image("2ndFleetImages/Stanford_L.jpg"),
    image("2ndFleetImages/Stanford_R.jpg")
  )
))
```
This is an example of how to use a pair of images, but you can also use a single image (whether as an array or just the
img), and it will be divided in two across the two pages.


#FullPageImageFramed(image("images/FullPageImg.png", fit: "stretch", width: 100%))

== Manual vs Automagic

Typst is capable of a lot of things, including reading in json files like those in the LCP. As such, this template can
parse through them and attempt to create properly formatted text. But you may not want to do that.

For example, below is the Ace talent, formatted as it is in the core book. To the right, is the automatically parsed LCP
file. As you can see, there are two additional boxes, and it takes up much more space. The LCP, while convenient, is
difficult to parse properly.


#PlaceTalent(
  (
    name: "Ace",
    description: [Every pilot brags about their abilities; occasionally, some even have the reputation to back it up. Harmonious
      Domesticity is one of these pilots. As an ace, they aren’t just ranked among the most qualified of pilots – they’re
      among the most qualified of lancers.

      Whether you’re a talented rookie or a grizzled veteran, you’re one of these aces. Your skills as a pilot are notorious
      enough that your callsign is known throughout the system.],
    ranks: (
      (
        name: "Acrobatics",
        description: [
          While *flying*, you get the following benefits:
          - You make all Agility checks and saves with *+1 #CC.Accuracy*.
          - Any time an attack misses you, you may fly up to *2 spaces* in any direction as a *reaction*
        ],
      ),
      (
        name: "Afterburners",
        description: [
          When you Boost while flying, you may move an additional *1d6 spaces*, but take *heat equal to half that amount.*
        ],
      ),
      (
        name: "Supersonic",
        description: [
          As a *quick action* on your turn, you may spin up your thrusters. If you end your turn *flying*, you may nominate a
          character within a Range equal to your Speed and line of sight, and gain this reaction:
          #ReactionBox(
            title: "Supersonic",
            title_tech: "Reaction, 1/round",
            trigger: "Your target's turn ends.",
            body: "You fly to a space free and adjacent to them. There must be a path to do so but you can move even if the nominated character is no longer within your movement range or line of sight. This ignores engagement and does not provoke reactions.",
          )
        ],
      ),
    ),
  ),
)

#PlaceTalent(ParseTalent(lcp, "Ace"))


=== What the Template Does
One of the most obvious things the template does automatically is the KeyWord system. A list of keywords sourced from
the Core Book are formatted in smallcaps. For example Accuracy, Boost, ect. Of course, this behavior can be manually
overridden. Use the ```typ #NoKeyword[Content]``` function to temporarily disable it. For example: #NoKeyword[Accuracy].
To apply the formatting to a word not on the list, do the opposite. ```typ #Keyword[Content]``` like this: #Keyword[Fight Me!]

The second thing that happens automatically is that the content of the Infoboxes is automatically symbolized. While the
CompCon symbols are available in the ```typ #CC.*``` dictionary (View them all #link(<Special-Symbols>)[Here]), the
Infobox will convert a subset of symbols automatically. This too can be done manually ```typ #AutoSymbolize[Content]``` allows
converting [Accuracy, Burst, Range] to [#AutoSymbolize[Accuracy, Burst, Range]]

There are also the "automagic" systems, that can also be done manually.
- Talents
- Mechs
- Equipment
- NPCs

==== Talents

Talents are fairly simple.
- Automagic is ```typ #PlaceTalent(ParseTalent(lcp, "Ace")) ```
- Manual requires replacing `ParseTalent` with a dictionary of the form ```typ (name:str, description:content, ranks:dict)```.

Note that `ranks` is an array with three values, each of which contains `name` and `description`. Description is a
content block, so it can contain anything, including action boxes, images, whatever.

Below is the exact code that produced the manual version (left column) on the previous page.

#figure(
  scope: "parent",
  placement: bottom,
)[#NoKeyword()[
  ```typ
  #PlaceTalent((name:"Ace", description:[
  Every pilot brags about their abilities; occasionally, some even have the reputation to back it up. Harmonious Domesticity is one of these pilots. As an ace, they aren’t just ranked among the most qualified of pilots – they’re among the most qualified of lancers.

  Whether you’re a talented rookie or a grizzled veteran, you’re one of these aces. Your skills as a pilot are notorious enough that your callsign is known throughout the system.
  ], ranks: (
    (name:"Acrobatics", description:[
      While *flying*, you get the following benefits:
        - You make all Agility checks and saves with *+1 #CC.Accuracy*.
        - Any time an attack misses you, you may fly up to *2 spaces* in any direction as a *reaction*
          ]),
    (name: "Afterburners", description:[
      When you Boost while flying, you may move an additional *1d6 spaces*, but take *heat equal to half that amount.*]),
    (name: "Supersonic", description:[
      As a *quick action* on your turn, you may spin up your thrusters. If you end your turn *flying*, you may nominate a character within a Range equal to your Speed and line of sight, and gain this reaction:
      #ReactionBox(title:"Supersonic", title_tech: "Reaction, 1/round", trigger:"Your target's turn ends.", body:"You fly to a space free and adjacent to them. There must be a path to do so but you can move even if the nominated character is no longer within your movement range or line of sight. This ignores engagement and does not provoke reactions.")
    ])
  )))
  ```
]]

==== Equipment
Creating boxes for equipment can also be done manually or automatically.
- Automagic is ```typ #ParseWeapon(lcp, weapon_name), or ParseSystem, ParseDeployable, ParseMod```
- Manually is by using the infoboxes, ```typ WeaponBox, ActionBox, PassiveBox``` or one of the others. Each of these has
  four parameters, `title, title_tech, body, flavor_text`
  - title is obvious, the large text at the top.
  - title_tech is the second line used for weapon damage, system costs, ect.
  - body is the main text of the equipment.
  - flavor_text is the fancy lore text that goes underneath the body.

#colbreak()
==== Mechs

Fully automating the display of a mech from the lcp is simple:
```typ
#FrameAutomatic(lcp, "Drake",
  background:image(width:7in,
      "images/IPS-N-Background.png"))
#FullPageImageFramed(image("images/Drake-Facing.jpg"))
#LicenseAutomatic(lcp, "Drake", 1)
#LicenseAutomatic(lcp, "Drake", 2)
#LicenseAutomatic(lcp, "Drake", 3)
```

Starting from the bottom, creating the Licence Level manually is

```typ #LicenseFull(level, header_names, blocks)```
- level is a number (1,2,3, usually)
- header_names is a list of names to go in the header box, so you can customize that as well.
- blocks is a list of content blocks, usually boxes, but could be text, additional rules, images, whatever

Placing the frame is more complicated.

```typ #PlaceFrame(frame, trait_blocks, mounts, core_system, background)```
- frame is a dictionary in the same format as the #link("https://github.com/massif-press/lancer-data#frames-framesjson")[lcp json],
  with a `name, source, description, mechtype,` and `stats`.
- trait_blocks is a list of content blocks for the mech traits, on the left side of the page between the stats and the
  mounts. Typically ```typ #TraitBox```.
- mounts is a list of mount types as strings, ex: "Main", "Aux", that will be displayed under the traits.
- core_system is a dictionary containting the fields `name` and `blocks`, with an optional field `description`.
  - name is a string.
  - blocks is a list of content blocks.
  - description is a content block or string that is the lore description of the core system. Optional.
- background is an optional image that is displayed behind the mech stats. If you're making your own, an easy way is to
  make the shape in a solid color, then make it 80% transparent.


== Mechs!

#FrameAutomatic(lcp, "Drake", background: image(width: 7in, "images/IPS-N-Background.png"))
#FullPageImageFramed(image("images/Drake-Facing.jpg"))
#LicenseAutomatic(lcp, "Drake", 1)
#LicenseAutomatic(lcp, "Drake", 2)
#LicenseAutomatic(lcp, "Drake", 3)

// #NPCAutomatic(lcpls, "Archon")

// == IPS-Northstar
// #for f in lcp.frames {
//   if (f.source == "IPS-N") {
//     FrameAutomatic(lcp, f.name, background: image(width: 7in, "images/IPS-N-Background.png"))
//     LicenseAutomatic(lcp, f.name, 1)
//     LicenseAutomatic(lcp, f.name, 2)
//     LicenseAutomatic(lcp, f.name, 3)
//   }
// }
// == Smith-Shimano Corpro
// #for f in lcp.frames {
//   if (f.source == "SSC"){
//     FrameAutomatic(lcp, f.name, background:image(width:7in, "images/SSC-Background.png"))
//     LicenseAutomatic(lcp, f.name, 1)
//     LicenseAutomatic(lcp, f.name, 2)
//     LicenseAutomatic(lcp, f.name, 3)
//   }
// }
== HORUS
This is where you put the lore and core bonuses and such.

#FrameAutomatic(lcp, "Minotaur", background: image(width: 7in, "images/Horus-Background.png"))
#LicenseAutomatic(lcp, "Minotaur", 1)
#LicenseAutomatic(lcp, "Minotaur", 2)
#LicenseAutomatic(lcp, "Minotaur", 3)


// #for f in lcp.frames {
//   if (f.source == "HORUS") {
//     FrameAutomatic(lcp, f.name, background: image(width: 7in, "images/Horus-Background.png"))
//     LicenseAutomatic(lcp, f.name, 1)
//     LicenseAutomatic(lcp, f.name, 2)
//     LicenseAutomatic(lcp, f.name, 3)
//   }
// }
// == Harrison Armoury
// #for f in lcp.frames {
//   if (f.source == "HA"){
//     FrameAutomatic(lcp, f.name, background:image(width:7in, "images/HA-Background.png"))
//     LicenseAutomatic(lcp, f.name, 1)
//     LicenseAutomatic(lcp, f.name, 2)
//     LicenseAutomatic(lcp, f.name, 3)
//   }
// }

#Section("Appendices")
== Special Symbols <Special-Symbols>
#place(
  top,
  float: true,
  scope: "parent",
  [These symbols can be printed by typing ```typ #CC.Name```, where `Name` is the text in the table.],
)
#let syms = ()

#for (k, v) in CC {
  syms.push(NoKeyword(k))
  syms.push(v)
}
#figure(placement: bottom, scope: "parent", table(columns: 8, ..syms))

