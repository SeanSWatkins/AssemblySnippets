# Multiple Of Three

This was an assignment for a university course. I didn't have a whole lot of time to get it done because of various other, uncontrollable factors (like other assignments that needed doing).  
I realise now I should have spent more time getting familiar with Assembly before attacking this assignment as the information on the net seems to be fragmented. I struggled to find assistance in what I wanted to do.   

#### Requirements
The requirements of this assignment:
- Use [NASM] (http://www.nasm.us/)
- Only use 16bit registers (i.e. Dos, this proved more difficult that I feel it should be)
  - I had to use [doxbox] (https://www.dosbox.com/) for this
- Clear the screen
- Change the background to white text on a blue background
- Print a message for the user to enter a number between 1 and 9
- Read the number as a string
- Convert the number from string into a number
- Check the number if between 1 and 9
  - if not print an error message and ask them to enter another number
- Once the number if validated, check if the number is divisible by 3
- If it is divisible by three print a message stating that it is a multiple of three, otherwise indicate that it isn't

Sounds pretty simple. I thought it was, which is why I left it late. That was a mistake.

Anyway, managed to get the majority of it working save for reading the number in as a string and converting it. I will attempt to get that done at some point, but for now it kinda, semi works... specifically when Jupitar and Pluto are aligned and the moon is half full.

*Note: I did this on Windows 10, but this should work similarly on Linux and OSX. I did run these same commands on a linux VM and it assembled fine, but I couldn't run it because I didn't have DosBox installed and couldn't be bothered with the time constraints.*  

#### Assembling

So once you have nasm installed and in your PATH variable (There are a million and one tutorials for this) call the following:
```bash
nasm -fbin -o multipleofthree.com -l multipleofthree.lst
```
I'll break down what this does...or at least what I think it does.

**nasm** - calls nasm (duh)  
**-fbin** - specifies the format, which must be 'bin' for 16bit dos, for linux I used '-felf64'
**-o multipleofthree.com** - specifies the output of the command, in this case I needed it to be a COM executable to run it in DosBox  
**-l multipleofthree.lst** - tells nasm to create a listing file of the name given.

That's about it. Just remember you can technically call the .com and .lst file anything you want, but it wouldn't make much sense had I outputted a file called 'unicornfarst.com.'  
Although thinking back it might not have been a terrible idea.

#### Running

Anyway, now to run the .com file in DoxBox. This took me a while to figure out.

After you have installed DosBox, open it and run the following:
```bash
mount c: C:\
```
This will mount your C drive so you can traverse it to find your COM file. If you want to you can always be more specific using something like:
```
mount c: C:\Users\{yourname}\{your}\{directory}\{structure}\
```
Then you won't have to specify the full path to your .com file every time you want to execute it.

Then you just have to actually call the .com file and it'll run if it's not broken
```
C:\USERS\ME\FOLDER\OF\AWESOME\MULTIPLEOFTHREE.COM
```
In DosBox you can use tab to speed up finding the right path, like you would in a normal terminal. Which is helpful. Also just a note, Dos seems to want everything in all caps...no idea why.
```
C:\Use <tab>
C:\USERS

C:\USERS\ME\FOL <tab>
C:\USERS\ME\FOLDER

etc
```

#### Debugging

**TO BE CONTINUED**
