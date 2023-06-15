#### View the IFS characters

```shell
$ set | grep ^IFS
  IFS=$' \t\n'
```

#### Create 30 empty files

```shell
$ for i in {1..30}; do touch file$i.txt; done
```

#### Check if a file exists

```shell
$ if [ -f testfile ]; then echo "exists"; else echo "does not exist"; fi
```

#### Fahrenheit to Celcius

```shell
$ echo "200" | awk '{print $1,"F is",( $1 - 32 )*5/9,"C"}'
200 F is 93.3333 C
```

#### Rename files

create a copy with new name, delete original

```shell
$ for f in config*New; do new_f=$(echo $f | sed 's/New//'); cp $f $new_f; rm -f $f; done;
```

#### Do something on the basis of string length

```shell
str="hello"; echo "len=${#str}"; if [[ ${#str} > 0 ]]; then echo "valid string"; else echo "empty string"; fi
```

#### Find out top 5 java files with maximum number of lines and display their line count

```shell
find . -name "*.java" -exec wc -l {} + | sort -rn | head -n 6 | tail +2
```
