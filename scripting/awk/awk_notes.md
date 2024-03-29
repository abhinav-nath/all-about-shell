# awk

```shell
$ cat hello.txt
first line
second line
third line
fourth line
fifth line
```

```shell
$ awk 'BEGIN{print "BEGIN part"} {print "Hello"} END{print "END part"}' hello.txt
BEGIN part
Hello
Hello
Hello
Hello
Hello
END part
```

```shell
$ echo "one two three four" | awk '{print $0}'
one two three four
```

```shell
$ echo "one two three four" | awk '{print $1}'
one
```

```shell
$ echo "one two three four" | awk '{print $2}'
two
```

```shell
$ echo "one two three four" | awk '{print $3}'
three
```

```shell
$ echo "one two three four" | awk '{print $4}'
four
```

```shell
$ cat employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      IT
Rick    45      HR
```

```shell
$ awk '{print $1}' employee_table.txt
NAME
Tony
Smith
John
Rick
```

```shell
$ awk '{print $1 "\t" $3}' employee_table.txt
NAME    UNIT
Tony    IT
Smith   HR
John    IT
Rick    HR
```

### Search patterns in `awk`

```shell
$ awk '/Rick/ {print $1 "\t" $3}' employee_table.txt
Rick    HR
```

don't print the header

```shell
$ cat employee_table.txt | awk '!/^NAME/ {print $0}' | awk '/IT/ {print $1 "\t" $3}'
Tony    IT
John    IT
```

```shell
$ cat employee_table.txt | awk '$1 == "John"'
John    37      IT
```

```shell
$ cat employee_table.txt | awk '$1 != "NAME"'
Tony    50      IT
Smith   35      HR
John    37      IT
Rick    45      HR
```

### `NF` - Number of Fields

```shell
$ echo "one two three four" | awk '{print NF}'
4
```

```shell
$ echo "one two three four" | awk '{print $NF}'
four
```

```shell
$ echo "one two three five" | awk '{print $NF}'
five
```

```shell
$ cat employee_table.txt | awk '{print "Number of fields in this line: " NF}'
Number of fields in this line: 3
Number of fields in this line: 3
Number of fields in this line: 3
Number of fields in this line: 3
Number of fields in this line: 3
```

### `NR` - Number of Records

```shell
$ echo "one two three five" | awk '{print NR}'
1
```

```shell
$ echo "one two three five" | awk '{print $NR}'
one
```

```shell
$ echo "ten two three five" | awk '{print $NR}'
ten
```

```shell
$ cat employee_table.txt | awk '{print NR}'
1
2
3
4
5
```

```shell
$ cat employee_table.txt | awk 'END{print NR}'
5
```

### `FS` - Field Separator

change the default field separator

```shell
$ echo "one two three four" | awk -F "two" '{print $1 $2}'
one  three four      -->      now "two" has become separator between "one" and "three four"
```

```shell
$ echo "one two three four" | awk -F "three" '{print $1 $2}'
one two  four
```

```shell
$ echo "one two three four" | awk -F "two" '{print $1 $2}'
one  three four
```

### `RS` - Record Separator

```shell
$ echo "one two three four" | awk 'BEGIN{RS="one"} {print $1 $2}'

twothree
```

```shell
$ echo "one two three four" | awk 'BEGIN{RS="two"} {print $1 $2}'
one
threefour
```

```shell
$ echo "one two three four" | awk 'BEGIN{RS="three"} {print $1 $2}'
onetwo
four
```

### Variables in awk

```shell
$ cat hello.txt
first line
second line
third line
fourth line
fifth line
```

```shell
$ cat hello.txt | awk 'BEGIN{RS="\n"; count=0} {count++} END{print NR, count}'
5 5
```

### `for` loop in awk

```shell
$ cat employee_table.txt
NAME    AGE     UNIT
Tony    50      IT
Smith   35      HR
John    37      IT
Rick    45      HR
```

```shell
$ cat employee_table.txt | awk '{for (i=1;i<=NF;i++) {print "field:",i,$i}}'
field: 1 NAME
field: 2 AGE
field: 3 UNIT
field: 1 Tony
field: 2 50
field: 3 IT
field: 1 Smith
field: 2 35
field: 3 HR
field: 1 John
field: 2 37
field: 3 IT
field: 1 Rick
field: 2 45
field: 3 HR
```

### Calculate total file size in a directory

```shell
$ ls -l | awk '{totalsize+=$5} END{print "Total file size: ", totalsize, "B"}'
Total file size:  9193 B
```

```shell
$ ls -l | awk '{totalsize+=$5} END{print "Total file size: ", totalsize/1024, "KB"}'
Total file size:  8.97754 KB
```

```shell
$ ls -l | awk '{totalsize+=$5} END{print "Total file size: ", totalsize/1024/1024, "MB"}'
Total file size:  0.00876713 MB
```
