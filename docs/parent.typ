#import "/lib.typ"
#set heading(numbering: "1.")
#show heading: set text(fill:blue)

= parent level-1 heading

== parent level-2 heading

#lib.offset-headings(2, include "./child.typ")

