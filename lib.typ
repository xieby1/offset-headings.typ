// 1. offset
//
// Offset does not propagate.
//
// 2. show: heading
//
// Due to recursive apply to generated heading, the following snippet does not work:
// `show heading: it => {... heading(...) ...}`.
//
// 3. Recursive func (Current approach):
//
// Inspired by https://github.com/typst/typst/issues/7913
#let offset-headings(offset, content) = {
  let f(c) = {
    show: it => {
      let itf = it.func()
      let itr = repr(itf)
      let ita = it.fields()
      if itr == "sequence" {
        itf(ita.children.map(f))
      } else if itr == "heading" {
        let body = ita.remove("body")
        ita.depth += offset
        let lbl = ita.remove("label", default: none)
        // Headings can carry a label field, but the heading constructor rejects it
        // Re-attach after rebuild to keep links/refs.
        // Check <test-label-handling>
        let h = itf(..ita, body)
        if lbl == none { h } else { [#h#lbl] }
      } else if itr == "styled" {
        itf(f(ita.remove("child")), ita.styles)
      } else {
        it
      }
    }
    c
  }
  f(content)
}
