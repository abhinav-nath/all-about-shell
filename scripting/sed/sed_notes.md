### `sed` usage

```shell
sed OPTIONS... [SCRIPT] [INPUTFILE...]
cat [INPUTFILE...] | sed OPTIONS... [SCRIPT]
```

SCRIPT:

```shell
[addr]X[options]
```

`X` is a single-letter `sed` command.

- `[addr]` can be a single line number, a regular expression, or a range of lines.
- If `[addr]` is specified, the command `X` will be executed only on the matched lines.
- Additional `[options]` are used for some `sed` commands.


This command deletes lines 30 to 35 in the input
30, 35 is an address range
`d` is the delete command

```shell
sed '30,35d' input.txt > output.txt
```

`sed` does not delete lines from `input.txt`
it just prints the changed lines, we need to redirect the output to `output.txt`

```shell
$ cat employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

```shell
$ sed '/Rick/p' employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

```shell
$ sed -n '/Rick/p' employee_table.txt
Rick    45      HR
```

```shell
$ sed -n '3p' employee_table.txt
Smith   35      HR
```

```shell
$ sed -n '2,7p' employee_table.txt
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

```shell
$ sed -n '2,$p' employee_table.txt   -->   from line 2 to last line
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

```shell
--------------
 a - append
 i - prepend
--------------
```

```shell
$ sed '/IT/a somestring' employee_table.txt
NAME    AGE     UNIT
somestring
Tony    50      IT
somestring
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
somestring
Bruce   42      PR
```

```shell
$ sed '/IT/i somestring' employee_table.txt
somestring
NAME    AGE     UNIT
somestring
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
somestring
Stacy   30      IT
Bruce   42      PR
```

```shell
$ sed '1i Employee List' employee_table.txt
Employee List
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

```shell
$ sed '/\tIT/d' employee_table.txt
NAME    AGE     UNIT
Smith   35      HR
John    37      PR
Rick    45      HR
Bruce   42      PR
```

#### `c` - change line option

```shell
$ sed '/PR/c Hidden information from PR unit' employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
Hidden information from PR unit
Rick    45      HR
Stacy   30      IT
Hidden information from PR unit
```

```shell
$ sed '/HR/c Hidden information from HR unit' employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Hidden information from HR unit
John    37      PR
Hidden information from HR unit
Stacy   30      IT
Bruce   42      PR
```

#### `q` - quit command

if John is found then quit with exitstatus 2

```shell
$ sed '/John/q2' employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      PR
```

```shell
$ echo $?
2
```

If we don't want to print any output then use `-n`

```shell
$ sed -n '/John/q2' employee_table.txt
```

```shell
$ echo $?
2
```

#### `-e` - run multiple `sed` commands

```shell
$ sed -n '/John/pq2' employee_table.txt
sed: -e expression #1, char 8: extra characters after command
```

```shell
$ sed -ne '/John/p' -ne '/John/q2' employee_table.txt
John    37      PR
```

```shell
$ echo $?
2
```

```shell
$ sed -e '/John/a after John' -e '/John/i before John' employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
before John
John    37      PR
after John
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

#### `i` - change in input file itself

```shell
$ cat employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

```shell
$ cp employee_table.txt employee_table2.txt
```

```shell
$ sed -n '/^C
```

```shell
$ sed -n '/Stacy/p' employee_table2.txt
Stacy   30      IT
```

```shell
$ sed -ni '/Stacy/p' employee_table2.txt
```

```shell
$ cat employee_table2.txt
Stacy   30      IT
```

#### `e` - execute shell commands

```shell
$ sed '/NAME/e echo -n "Date: "; date' employee_table.txt
Date: Sun, Nov  1, 2020 10:16:17 PM
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      PR
Rick    45      HR
Stacy   30      IT
Bruce   42      PR
```

#### `s` - substitute

```shell
s/regex/replacement/[flags]
```

Search for a string that matches the regex. If found, replace matched string with replacement.

```shell
$ echo "one five three" | sed 's/five/two/'
one two three
```

```shell
$ echo "John is 50 years old" | sed 's/[[:digit:]]\+/**/'
John is ** years old
```

```shell
[ g flag - globally ]
```

```shell
$ echo " 0 2 9 0 5" | sed 's/0/1/'
 1 2 9 0 5
```

```shell
$ echo " 0 2 9 0 5" | sed 's/0/1/g'
 1 2 9 1 5
```

Replace ages above 40 with `**`

```shell
$ sed 's/[4-9][[:digit:]]\+/**/' employee_table.txt
NAME    AGE     UNIT
Tony    **      IT
Smith   35      HR
John    37      PR
Rick    **      HR
Stacy   30      IT
Bruce   **      PR
```

In the replacement part, `&` indicates the matched string:

```shell
$ sed 's/HR/& & &/' employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR HR HR
John    37      PR
Rick    45      HR HR HR
Stacy   30      IT
Bruce   42      PR
```
