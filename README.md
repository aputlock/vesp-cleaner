# Vesp Cleaner for Yavuz Oruc's ENEE350 at UMD

This script cleans a file of comments and newlines, allowing for documented code in VESP.

- Comments begin with # and extend for the rest of the line
- Two instructions can be written on a single line, useful for operations such as LDA or MOV
- Blank lines can help the user envision logical "code blocks"

The first line of the source file should be the program's starting address, then the rest of the program should be entered, ending with a HLT.

Usage: `ruby clean.rb <source file>`

Dependencies: ruby, bash, gcc

Use the script in the appropriate folder for the version of vesp you are using.
