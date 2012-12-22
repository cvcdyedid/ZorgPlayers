ZorgPlayers
===========

The Zorg team was a team which developed a player for the CodeGuru Xtreme competition of 2012.
Our players got to the 1st place in the competition.

We want to share our players with their source codes and comments, and hope that it will be of any help to
other teams in the future.

You will see many players in this repo. Each has a short description in its beginning to explain its main idea.
We developed them along the way and left the older ones when we had a better idea.

The name Zorg emerged when we thought we had a need to have the last turn in the game. Therefore, we chose a name
which is as far as we can into the ABC. We left the idea which needed this name, but didn't change the name.

Zorg (which is actually spelled Zurg) is the name of the "bad guy" of "Toy Story". We spelled it Zorg because we 
thought that more people will read it correctly like this.

When moving from the 1st stage to the second, we actually picked an older player which was stored in our archives.
Their ideas are very similar: one is with a "loop" of stosw-push and the other with movsw-push
The one with the movsw-push loop, which was sent to the 1st stage, filled its team's stack with a long chain of
movsw-push-movsw-push-... using int 0x86

We switched to the older version because we needed a version which took control of the zombies correctly.
We didn't have enough time to make such a version for the most updated player, but we did have a version of the older
player which implemented the control of a zombie, so we decided to take it in the last few minutes of the 3 hours
within the competition. It proved to be a good decision :).

Taking control over the zombies worked like this:
- We found some bytes to attack using int 0x87. We attacked them to do xor bx,bx (2 bytes) and jmp bx (2 bytes)
- Before using the int 0x87, we wrote a code which made the zombiw jump to our code in the beginning of the ring,
  in address 0.
- The zombie jumped into a special code which initialized it and made it run like us, but with a counter which
  forced it to die after a certain amount of jumps.

During the 3hrs of the competition, someone got into the lab and told us that the EndOfTheWorld team got more ponits
then us in one of the executions. We immediately sought for ways to kill their players.

They used call word far [di] as an attacking technique, while standing in a static location.
We knew that the will change this static address, and suspected that they will change the register to [si], and they
did it.
So, in order to be independent of the exact address and the register, we used the bytes which are written into the
ring in the beginning of the game.
Insted of using int 0x87 on the bytes of call word far [di], we used 0xccccccff. We know that the ring is filled with
0xcc at the beginning, so we just replace the first byte of their opcode to junk and kill them, no matter where they are
and no matter if the switched the register to [si].
