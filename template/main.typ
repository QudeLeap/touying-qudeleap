#import "@preview/touying:0.6.1": *
#import "@preview/touying-qudeleap:0.1.0": *

// Specify `lang` and `font` for the theme if needed.
#show: qudeleap-theme.with(
  // lang: "zh",
  // font: (
  //   (
  //     name: "Libertinus Serif",
  //     covers: "latin-in-cjk",
  //   ),
  //   "Source Han Sans SC",
  //   "Source Han Sans",
  // ),
  config-info(
    title: [Touying for QudeLeap: Customize Your Slide Title Here],
    subtitle: [Customize Your Slide Subtitle Here],
    author: [Your Name],
    date: datetime.today(),
    institution: [QudeLeap],
  ),
)

#title-slide()

#outline-slide()

= The section I

== Slide I / i

Slide content.

== Slide I / ii

Slide content.

= The section II

== Slide II / i

Slide content.

== Slide II / ii

Slide content.
