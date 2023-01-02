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