// QudeLeap slide theme for Touying.
// Palette sampled from the QudeLeap logo: deep navy -> electric violet.
#import "@preview/touying:0.6.1": *
#import themes.stargazer: *

#let qude-violet = rgb("#7544f3")
#let qude-indigo = rgb("#4030e0")
#let qude-navy = rgb("#041550")
#let qude-ink = rgb("#0f172a")
#let qude-paper = rgb("#fbfaff")
#let qude-slate = rgb("#64748b")

#let qude-header-logo = image("assets/vi/qude-logo-horizontal.png", width: 4.56cm)

#let qude-navigation(self) = context {
  let body() = {
    let sections = query(heading.where(level: 1))
    if sections.len() == 0 {
      return
    }
    let current-page = here().page()
    set text(size: 0.5em)
    for (section, next-section) in sections.zip(sections.slice(1) + (none,)) {
      set text(fill: if section.location().page() <= current-page and (
        next-section == none or current-page < next-section.location().page()
      ) {
        self.colors.primary
      } else {
        self.colors.neutral
      })
      box(inset: 0.5em)[#link(section.location(), utils.short-heading(self: self, section))<touying-link>]
    }
  }

  block(
    fill: self.colors.neutral-lightest,
    inset: 0pt,
    outset: 0pt,
    block(
      fill: self.colors.neutral-lightest,
      width: 100%,
      height: 2.3em,
      {
        place(center + horizon, body())
        place(right + horizon, dx: -0.2em, utils.call-or-display(self, self.store.header-right))
      },
    ),
  )
}

#let qudeleap-theme(
  aspect-ratio: "16-9",
  lang: "en",
  font: ("Libertinus Serif",),
  ..args,
  body,
) = {

  set text(lang: lang, font: font)
  show: if lang == "zh" {
    import "@preview/cuti:0.3.0": show-cn-fakebold
    show-cn-fakebold
  } else {
    it => it
  }

  show: stargazer-theme.with(
    aspect-ratio: aspect-ratio,
    config-colors(
      primary: qude-violet,
      primary-dark: qude-navy,
      primary-darker: rgb("#03103d"),
      primary-darkest: rgb("#010823"),
      secondary: qude-paper,
      tertiary: qude-indigo,
      neutral: qude-slate,
      neutral-light: rgb("#cbd5e1"),
      neutral-lighter: rgb("#e2e8f0"),
      neutral-lightest: rgb("#f8fafc"),
      neutral-dark: rgb("#334155"),
      neutral-darker: rgb("#1e293b"),
      neutral-darkest: qude-ink,
    ),
    config-page(fill: qude-paper),
    config-info(
      logo: qude-header-logo,
    ),
    config-store(
      navigation: qude-navigation,
    ),
    ..args,
  )

  body
}
