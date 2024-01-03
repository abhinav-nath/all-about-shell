# Textmate setup for Java

<img width="401" alt="image" src="https://github.com/abhinav-nath/all-about-shell/assets/48696735/76b158ff-de30-4835-82b4-072c2d73a80e">

go to `Bundles` > `Edit Bundles...` > `Java` > `Menu Actions` > `Compile & Run`

Update the code:

```shell
#!/bin/sh 
if [ -f "./compile.sh" ]; then
   /bin/sh ./compile.sh
else
   cd "$TM_DIRECTORY" 
   javac "$TM_FILENAME" && java "${TM_FILENAME%.java}" 
fi
```

Change according the picture:

<img width="1195" alt="image" src="https://github.com/abhinav-nath/all-about-shell/assets/48696735/437f7181-3610-4c8f-ab5e-dca9b1dd1e92">

- The script above will look for a `compile.sh` script in the folder of your java file and if found it will run that.
- You can do whatever you like in that `compile.sh` file. If no such file is found it will compile the current java file being edited and run that one.
- Now just `command+R` on a Java file.
- The output will be shown as a tooltip at your cursor.

## Increase Tooltip size

Run below command:

`defaults write com.macromates.TextMate NSToolTipsFontSize 24`
