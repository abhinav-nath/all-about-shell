# Useful commands for Mac

## Appending images in ImageMagick

For vertical stacking (top to bottom):

```
convert -append 1.jpg 2.jpg out.jpg
```

For horizontal stacking (left to right):

```
convert +append 1.jpg 2.jpg out.jpg
```

## Fixing Docker issue on M1 Macbook Pro

```shell
rm -rf ~/Library/Group\ Containers/group.com.docker
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/.docker
```

## Find and kill port in use

```shell
kill -9 $(lsof -ti:3000)
```

**For multiple ports:**

```shell
kill -9 $(lsof -ti:3000,3001)
```
