## CHECK BUILD

### What is it?

It is a bash script, that checks for every commit, which pnpm build was not
successful and prints the commit short hash.


### How does it work?

It works by checking out to every commit and running the command, `pnpm build`. If the 
build was not successful, it prints all the commits where the build was not
successful. 


### Why it is important

You can think of it as a debuging script, that helps you know which commit 
introduced a build error.


### Remarks:

Of course its not perfect, however, feel free to fork and improve upon it.
