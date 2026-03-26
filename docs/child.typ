#import "/lib.typ"
#set heading(numbering: "1.")
#show heading: set text(fill:green)

= child level-1 heading

== child level-2 heading

#lib.offset-headings(2, include "./grandchild.typ")
