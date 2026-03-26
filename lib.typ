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
        itf(..ita, body)
      } else {
        it
      }
    }
    c
  }
  f(content)
}
