import re
from urllib.request import urlopen

latex_command = re.compile("[\\\\][a-zA-Z@][a-zA-Z]*")

with urlopen("http://en.wikibooks.org/wiki/LaTeX/Command_Glossary") as f:
    doc = str(f.read())

commands = set()
for match in latex_command.finditer(doc):
    commands.add(doc[match.start():match.end()])

# Manually add some terms that are annoying to match
for command in "\\,;:!-=><+'`|()[]":
    commands.add("\\" + command)
    
with open("ac-dict-local/latex-mode", "w") as f:
    for command in sorted(commands):
        f.write(command[1:] + "\n")
