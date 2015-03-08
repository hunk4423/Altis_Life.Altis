if(playerside in [west,independent]) exitWith {};

hint parseText format
["
<t color='#00ff00'><t size='2'>Karma:</t></t><br/>
<t color='#EC891D'><t size='1.5'>%1</t></t><br/><br/>
<t color='#00ff00'><t size='2'>Skill Points</t></t><br/><br/>
<t color='#EC891D'><t size='1.5'>Food</t></t><br/><br/>
<t color='#EC891D'><t size='1'>Apple:</t></t> %2<br/>
<t color='#EC891D'><t size='1'>Peach:</t></t> %3<br/>
<t color='#EC891D'><t size='1'>meat:</t></t> %4<br/>
<t color='#EC891D'><t size='1'>fish:</t></t> %18<br/>
<t color='#EC891D'><t size='1'>crabs:</t></t> %5<br/><br/>
<t color='#9bbc57'><t size='1.5'>mining</t></t><br/><br/>
<t color='#9bbc57'><t size='1'>quarry stone:</t></t> %6<br/>
<t color='#9bbc57'><t size='1'>clay:</t></t> %7<br/>
<t color='#9bbc57'><t size='1'>coal:</t></t> %8<br/>
<t color='#9bbc57'><t size='1'>Diamond:</t></t> %9<br/>
<t color='#9bbc57'><t size='1'>Copper:</t></t> %10<br/>
<t color='#9bbc57'><t size='1'>Iron:</t></t> %11<br/>
<t color='#9bbc57'><t size='1'>salt:</t></t> %12<br/>
<t color='#9bbc57'><t size='1'>Sand:</t></t> %13<br/>
<t color='#9bbc57'><t size='1'>Oil:</t></t> %14<br/><br/>
<t color='#ff0000'><t size='1.5'>illegal</t></t><br/><br/>
<t color='#ff0000'><t size='1'>marijuana:</t></t> %15<br/>
<t color='#ff0000'><t size='1'>cocaine:</t></t> %16<br/>
<t color='#ff0000'><t size='1'>Heroin:</t></t> %17<br/>
",
life_D41_Karma,
life_skillApple,
life_skillPeach,
life_skillRawmeat,
life_skillKrabben,
life_skillBruchstein,
life_skillTon,
life_skillcoalu,
life_skillDiamond,
life_skillCopperore,
life_skillIronore,
life_skillSalt,
life_skillSand,
life_skillOilu,
life_skillCannabis,
life_skillCocaine,
life_skillHeroinu,
life_skillFischen
];