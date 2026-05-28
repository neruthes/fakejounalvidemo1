#let fake__brand_color = rgb("#FFD390")
#let __font_serif = ("Libertinus Serif", "TeX Gyre Termes", "Noto Serif CJK SC")
#let __font_sans = ("TeX Gyre Heros", "Noto Sans CJK SC")



#let make_title(input_toml) = {
  let dataobj = input_toml

  set text(number-width: "tabular")
  set par(first-line-indent: 0em)
  block(width: 100%, spacing: 15mm, [
    #set text(font: __font_sans, size: 10pt)
    *FAKE JOURNAL PREPRINT*
    #h(1fr)
    #dataobj.editor.obj_id

    #text(tracking: 0.11em, weight: 600, fill: fake__brand_color.darken(20%), upper(dataobj.editor.category_label))

    // #block(width: 100%, height: 0.44pt, fill: gray)
  ])

  block(width: 100%, spacing: 10mm, [
    // 1. Article Title
    #block(width: 70%)[
      #set par(justify: false)
      #text(size: 16pt, weight: 700, font: __font_sans, dataobj.article.title)
    ]
    #v(4mm)

    // 2. Authors Row (Fixed with unified paragraph and non-breaking boxes)
    #par(leading: 0.65em, [
      #set text(font: __font_sans)
      #(
        dataobj
          .author
          .map(auth => {
            // Keeping the name and its superscripts welded together in a single box
            box([
              #text(size: 11pt, weight: 500, auth.full_name)
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
    // #v(6mm)

    // 3. Affiliations Block
    #block(width: 100%, {
      let aff_dict = dataobj.affiliations
      for (key, aff) in aff_dict [
        #text(size: 9pt, fill: gray.darken(70%), [
          #super(key) #aff.organization, #aff.city, #aff.country
        ])
        #v(0.01mm)
      ]
    })
    // #v(5mm)

    // 4. Modern minimalist separator accent
    // #line(length: 100%, stroke: 0.5pt + gray.lighten(40%))
  ])
}



#let mode_2col(doc) = {
  columns(2, gutter: 16pt, doc)
}



#let enable_heading_numbering(doc) = {
  set heading(numbering: "1.1.1.1.1.1    ")
  doc
}

#let make_single(doc) = {
  set page(paper: "a4", margin: (top: 15mm, bottom: 20mm, left: 15mm, right: 15mm), footer: [
    #h(1fr)
    #set text(size: 9pt, font: __font_sans, weight: 500)
    #context counter(page).display()])
  set text(font: __font_serif, size: 10pt)
  set par(leading: 0.6em, spacing: 0.6em, justify: true, first-line-indent: 2em)
  set table(inset: 4pt, stroke: 0.33pt + black.lighten(20%))
  show table: set par(justify: false)

  show heading: it => {
    let dep = it.depth
    let size = (7 - dep) * 1.5pt + 3.5pt
    set par(first-line-indent: 0mm)
    set text(
      font: __font_sans,
      weight: 600,
      size: size,
    )
    block[
      #v(2 * size, weak: true)
      #it
      #v(1 * size, weak: true)
    ]
  }

  show columns: it => {
    v(10pt, weak: false)
    it
    v(10pt, weak: true)
  }

  doc
}
