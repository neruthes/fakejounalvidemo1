#set page(paper: "a4", margin: 22mm)
#set text(size: 11pt, font: ("FreeSans", "Noto Sans CJK SC"))


#let font_brand = ("DM Serif Display",)
#let font_serif = ("FreeSerif", "Noto Serif CJK SC")
#let font_sans1 = ("TeX Gyre Heros", "Noto Sans CJK SC")
#let font_sans2 = ("Barlow", "Noto Sans CJK SC")



#align(center)[
  #v(70mm)
  #set text(size: 25pt, weight: 600)
  FAKE JOURNAL \ PROVISIONAL VISUAL IDENTITY \ VERSION 1
]
#pagebreak()



= BRAND COLOR
#let special_text_color__gold = rgb("#FFD390")

#text(size: 12mm, `#FFD390`)

RED: 255\ GREEN: 211\ BLUE: 144
// RGB(255, 211, 144)


#[
  #set grid(columns: (40mm, 1fr), rows: auto, gutter: 7mm)
  #let iblock = block.with(width: 100%, height: 40mm, inset: 12mm, stroke: black.transparentize(90%))
  #iblock(fill: black, grid(
    box(width: 100%, height: 99%, fill: special_text_color__gold),
    text(fill: white)[Color on dark background],
  ))
  #iblock(fill: white, grid(
    box(width: 100%, height: 99%, fill: special_text_color__gold),
    [Color on bright background],
  ))

]



#page(fill: black, margin: 15mm)[

  #set text(fill: white)

  #align(right)[
    #set par(spacing: 0.7em)
    #set text(font: font_sans2, stretch: 90%, tracking: 0.3em, size: 10pt, weight: 500)
    #box(inset: (top: -4mm, right: -4mm))[
      ISSUE 1

      #set text(fill: special_text_color__gold)
      INAUGURAL ISSUE
    ]
  ]
  #v(1mm)

  #let titlewidth = 142mm

  // #let maintitle = scale(reflow: true, y: 20% * titlewidth, x: titlewidth, box(
  //   inset: (left: -1.1mm, right: -1.1mm),
  //   text(
  //     size: 66mm,
  //     font: font_brand,
  //   )[FAKE],
  // ))
  // #maintitle
  #image("logo1-2.svg", width: titlewidth)


  #box(width: titlewidth)[
    #let halfrule = box(width: 1fr, height: 3pt, inset: (bottom: 6pt), box(
      width: 1fr,
      height: 1pt,
      fill: special_text_color__gold,
    ))
    #set text(fill: special_text_color__gold, font: font_sans2, stretch: 90%, tracking: 0.3em, size: 10pt, weight: 500)
    #halfrule;#h(5pt);THE JOURNAL OF UNVERIFIABLE DISCOVERIES#h(5pt);#halfrule;
  ]
  #v(4mm)


  #set par(leading: 0.7em, spacing: 0.6em)

  #[
    #set text(font: font_sans2, stretch: 80%, weight: 500, spacing: 70%)
    #[
      #text(size: 20mm)[CLONED]
      #linebreak()
      #text(size: 25mm)[T. REX]

      #set par(leading: 0.15em, spacing: 0.4em)
      #text(size: 9mm, fill: special_text_color__gold)[JURASSIC PARK\ OPENS SOON]
    ]
  ]
  #v(2mm)

  #let smallbox(it) = block(spacing: 5mm, width: 36mm, it)
  #set text(size: 11pt, font: font_sans1)
  #set par(leading: 0.38em)

  #box(width: 10mm, height: 2pt, fill: special_text_color__gold)
  #smallbox[Final safety checks underway.]

  #box(width: 36mm, height: 1pt, fill: special_text_color__gold)
  #smallbox[Opening delayed by minor containment concerns.]

  #box(width: 36mm, height: 1pt, fill: special_text_color__gold)
  #smallbox[Tickets sold out before ethics review.]

]

