# blockcert
A Blockchain Certificate / Diploma (ABCD Token)

This is the tool I use to issue ERC-721 tokens containing certification for courses I run, as a service to students. They are ownable but this is only to identify the training supplier.

The reason we have both a student name and a TomoChain address is to allow 2 ways for students to demonstrate that the certificate is really theirs -- via their name, or by proving they have access to the associated TomoChain address. If they just pick one for privacy reasons, that's OK, I just leave the other as 'Anonymous' -- this is why the Tomochain address is stored as a string and not an address.

You'll need to import Openzeppelin contracts to use this: https://github.com/OpenZeppelin/openzeppelin-solidity

You'll also need to trigger the constructor on deploying to a blockchain, e.g. by including something like this in 1_initial_migration.js in Truffle:

  const _name = "A Blockchain Diploma and Certificate";
  const _symbol = "ABCD";

I deployed on TomoChain (http://tomochain.com/) to save costs -- issuing certificates this way on TomoChain is cheaper than printing on A4 paper.

If you need information on how to deploy to a non-Ethereum blockchain, I found this helpful:
https://medium.com/tomochain/how-to-build-a-dapp-on-tomochain-85532a1192e7

Should work on Ethereum too of course.

Once loaded on chain, use the mint function via Web3 or similar to issue tokens. 

The file check_certification.py provides an example standalone application that can return a student's certification. Currently it connects to a live contract, and if you run it, it should return my personal Tomo address and my role in the course (instructor) as token 0.
  

