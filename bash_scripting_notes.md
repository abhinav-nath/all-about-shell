https://www.shellcheck.net/

Finds bugs in your shell scripts


### exit status of a command using `$?`

```shell
$ ls -l | awk '/^-/' | grep "\.txt"

-rw-r--r-- 1 ABHNATH 1049089 1122 Oct 30 20:25 notes.txt
-rw-r--r-- 1 ABHNATH 1049089  414 Oct 30 19:48 one_liner_scripts.txt
```

```shell
$ echo $?
0
```

```shell
$ ls -l | awk '/^-/' | grep "\.txtt"
```

```shell
$ echo $?
1
```

#### `echo -e`

The `-e` option is used for telling echo that the string passed to it contains special characters and requires extended functionality.

```shell
$ echo "hello\tworld"

hello\tworld
```

```shell
$ echo -e "hello\tworld"

hello   world
```

```shell
$ echo -e "hello\nworld"

hello
world
```

#### Tracing the script

To turn on echo/trace for an entire script, the `-x` option can be added in the shebang line

```shell
#!/bin/bash -x
```

or

```shell
bash -x some-script
```

Example :

```shell
$ bash -x tolower.sh "Hello World"

+ '[' 1 -ne 1 ']'
+ echo 'Hello World'
+ tr '[:upper:]' '[:lower:]'
hello world
```

The `set -x` turns on echo/trace.
The `{ set +x; } 2> /dev/null` turns off echo/trace and absorbs the output into the special `/dev/null` output device.

#### factorial.sh

```shell
#!/bin/bash
echo -n "Enter the number : "
read -r num
fact=1
while [ "$num" -ne 0 ]; do
        set -x
        fact=$((fact * num))
        { set +x; } 2> /dev/null
        num=$((num - 1))
done
echo "factorial = $fact"
```

```shell
$ ./factorial.sh

Enter the number : 5
+ fact=5
+ fact=20
+ fact=60
+ fact=120
+ fact=120
factorial = 120
```
