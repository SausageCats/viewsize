# viewsize

This is to view size of files or directories in easily readable format.

```bash
$ viewsize.sh
#Giga       Mega          Kilo             Byte   |   File or Directory Names
             231        231612        231612604   |   C
                                             47   |   G
    1       1152       1152350       1152350404   |   B
   33      33133      33133841      33133841516   |   A
                             8             8888   |   F
              10         10994         10994776   |   D
               1          1029          1029104   |   E
   34      34529      34529837      34529837339   |   total



$ viewsize.sh | sort -n -k 5
                                             47   |   G
                             8             8888   |   F
               1          1029          1029104   |   E
              10         10994         10994776   |   D
             231        231612        231612604   |   C
    1       1152       1152350       1152350404   |   B
   33      33133      33133841      33133841516   |   A
   34      34529      34529837      34529837339   |   total


$ viewsize.sh a*
                             1             1952   |   a
                           534           534186   |   ab
    1       1038       1038704       1038704681   |   abc
             602        602640        602640677   |   abcd
              30         30981         30981013   |   abcde
    1       1672       1672862       1672862509   |   total
```
