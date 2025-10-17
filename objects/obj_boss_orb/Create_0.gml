owner   = global.boss;   // boss id
orb_r   = owner.sprite_width/3;      // radius



//init in different points of the unit circle
n = irandom(9);
x = x + cos(n) * orb_r;
y = y + sin(n) * orb_r;