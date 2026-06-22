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
      logo: image("assets/vi/qude-logo-transparent.png", height: 1.15em),
    ),
    config-store(
      navigation: self => components.simple-navigation(
        self: self,
        primary: self.colors.primary,
        secondary: self.colors.neutral,
        background: self.colors.neutral-lightest,
        logo: utils.call-or-display(self, self.store.header-right),
      ),
    ),
    ..args,
  )

  body
}
