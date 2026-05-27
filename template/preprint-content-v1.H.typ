// #import "@preview/ose-pic:0.1.2": *

#let __font_serif = ("Libertinus Serif", "TeX Gyre Termes", "Noto Serif CJK SC")
#let __font_sans = ("TeX Gyre Heros", "Noto Sans CJK SC")



#let make_title(input_toml) = {
  // place(top + center, dy: -13mm, text(
  //   size: 15pt,
  //   font: __font_sans,
  //   weight: 600,
  //   fill: gray.transparentize(55%),
  // )[FAKE JOURNAL PREPRINT])

  // let info = toml(args.named().at("info-path", default: "info.toml"))
  // let dataobj = info
  let dataobj = input_toml
  // let dataobj = toml(input_toml)
  set text(number-width: "tabular")

  block(width: 100%, spacing: 15mm, [
    #set text(font: __font_sans, size: 10pt)
    *FAKE JOURNAL PREPRINT*
    #h(1fr)
    #dataobj.editor.obj_id

    #block(width: 100%, height: 0.44pt, fill: gray)
  ])

  block(width: 100%, spacing: 10mm, [
    // 1. Article Title
    #text(size: 19pt, weight: 700, font: __font_sans, dataobj.article.title)
    #v(8mm)

    // 2. Authors Row (Fixed with unified paragraph and non-breaking boxes)
    #par(leading: 0.65em, [
      #(
        dataobj
          .author
          .map(auth => {
            // Keeping the name and its superscripts welded together in a single box
            box([
              #text(size: 12pt, weight: 500, auth.full_name)
              #super(text(fill: gray.darken(40%), {
                auth.affiliations.map(str).join(",")
              }))
              #if auth.corresponding == true [
                #super(text(fill: blue.darken(40%), "*"))
              ]
            ])
          })
          .join(text(fill: gray.darken(40%), ",  "))
      )
    ])
    #v(6mm)

    // 3. Affiliations Block
    #block(width: 100%, {
      let aff_dict = dataobj.affiliations
      for (key, aff) in aff_dict [
        #text(size: 9pt, fill: gray.darken(70%), style: "italic", [
          #super(key) #aff.organization, #aff.city, #aff.country
        ])
        #v(1mm)
      ]
    })
    #v(5mm)

    // 4. Modern minimalist separator accent
    #line(length: 100%, stroke: 0.5pt + gray.lighten(40%))
  ])
}

#let make_preprint(doc) = {
  set page(paper: "a4", margin: 25mm)
  set text(font: __font_serif, size: 13pt)
  set par(leading: 0.5em, spacing: 1em, justify: true)
  

  show heading.where(level: 1): it => [
    #v(1.2em)
    #set text(weight: "bold", size: 18pt)
    #it
    #v(0.4em)
  ]
  
  show heading.where(level: 2): it => [
    #v(0.8em)
    #set text(weight: "semibold", size: 14pt)
    #it
    #v(0.2em)
  ]
  
  doc
}
