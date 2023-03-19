# G-DrugSelling

G-DrugSelling is a script for FiveM QBCore for selling drugs (or any items) from the player's inventory via vehicle and/or walk up, or target, at configurable coordinates.

<h1>INSTALLATION GUIDE</h1>

1. Drop the g-drugselling folder into your [standalone] folder (or whichever other ensured folder you want to use)

<h1>FEATURES</h1>

- Create locations anywhere for selling items and choose sellable items and rewards for each location
- Enable/disable locations, blips, markers, NPCs, and notifications
- Configure means of selling by location
  - Examples include walk up, drive up, both, or target
- Configure sellable quantities and reward amounts per item
- Configure police required to sell and chance of police alert per location

**IMAGES**
-----
![Drug Selling NPC](https://i.ibb.co/rZHcgPr/drugsellingnpc.png)
![Drug Selling NPC Target](https://i.ibb.co/cQ3NPPS/drugsellingnpctarget.png)
![Drug Selling NPC Sell Rewards](https://i.ibb.co/5LB815k/drugsellingnpcsellrewards.png)

**DEPENDENCIES**
-----
- [QBCore](https://github.com/qbcore-framework)
    - [qb-core](https://github.com/qbcore-framework/qb-core)
    - [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
    - [qb-target](https://github.com/qbcore-framework/qb-target)

**CREDIT**
-----
Code excerpts for NPC spawning and the concept of NPC render distance were repurposed and refactored from [pickle_farming](https://github.com/PickleModifications/pickle_farming).
Code excerpts for caching current police count were repurposed from [qb-jewelery](https://github.com/qbcore-framework/qb-jewelery).
