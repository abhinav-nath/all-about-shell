Create 30 txt and 30 img files by using below commands:

```shell
for i in {1..30}; do touch file$i.img; done

for i in {1..30}; do touch file$i.img; done
```

now to list all txt files from 1-9

```shell
$ ls file[1-9].txt
```

list txt and img files both from 1-9

```shell
$ ls file[1-9].{txt,img}
```

list txt files from 5-15

```shell
$ ls file{[5-9],[1][0-5]}.txt
```

list img files from 13-21

```shell
$ ls file{[1][3-9],[2][0-1]}.img
```

list all files which have 3 characters long extension starting with 't'

```shell
$ ls *.t??
```
