/obj/structure/fence
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence0"
	density = 1
	anchored = 1
	var/health = 50
	var/health_max = 50
	var/cut = 0 //Cut fences can be passed through
	var/junction = 0 //Because everything is terrible, I'm making this a fence-level var
	var/basestate = "fence"

/obj/structure/fence/shortend1south
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence1"
	density = 1
	anchored = 1

/obj/structure/fence/shortend1north
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence2"
	density = 1
	anchored = 1

/obj/structure/fence/middlevert
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence3"
	density = 1
	anchored = 1

/obj/structure/fence/largeendleft
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence4"
	density = 1
	anchored = 1

/obj/structure/fence/shortendleft
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence5"
	density = 1
	anchored = 1

/obj/structure/fence/cornersoutheast1
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence6"
	density = 1
	anchored = 1

/obj/structure/fence/cornersoutheast1
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence7"
	density = 1
	anchored = 1

/obj/structure/fence/largeendright
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence8"
	density = 1
	anchored = 1

/obj/structure/fence/shortendright
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence9"
	density = 1
	anchored = 1

/obj/structure/fence/cornersouthwest1
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence10"
	density = 1
	anchored = 1

/obj/structure/fence/cornersouthwest2
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence11"
	density = 1
	anchored = 1

/obj/structure/fence/middlehor
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence12"
	density = 1
	anchored = 1

/obj/structure/fence/xjunc
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence13"
	density = 1
	anchored = 1

/obj/structure/fence/tjunc
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence14"
	density = 1
	anchored = 1

/obj/structure/fence/tjunc2
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence15"
	density = 1
	anchored = 1

/obj/structure/fence/cornernorthwest
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence16"
	density = 1
	anchored = 1

/obj/structure/fence/cornernortheast
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "fence17"
	density = 1
	anchored = 1

//create_debris creates debris like shards and rods. This also includes the window frame for explosions
//If an user is passed, it will create a "user smashes through the window" message. AM is the item that hits
//Please only fire this after a hit
/obj/structure/fence/proc/healthcheck(make_hit_sound = 1, create_debris = 1, mob/user, atom/movable/AM)

	if(cut) //It's broken/cut, just a frame!
		return
	if(health <= 0)
		if(user)
			user.visible_message("<span class='danger'>[user] smashes through [src][AM ? " with [AM]":""]!</span>")
		playsound(loc, 'sound/effects/grillehit.ogg', 25, 1)
		cut_grille()
	if(make_hit_sound)
		playsound(loc, 'sound/effects/grillehit.ogg', 25, 1)

/obj/structure/fence/ex_act(severity)
	switch(severity)
		if(1)
			del(src) //Nope
		if(2)
			del(src)
		if(3)
			health -= rand(25, 55)
			healthcheck(0, 1)

/obj/structure/fence/hitby(AM as mob|obj)
	..()
	visible_message("<span class='danger'>[src] was hit by [AM].</span>")
	var/tforce = 0
	if(ismob(AM))
		tforce = 40
	else if(isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce
	health = max(0, health - tforce)
	healthcheck()

/obj/structure/fence/attack_hand(mob/user as mob)
	if(HULK in user.mutations)
		user.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!"))
		user.visible_message("<span class='danger'>[user] smashes through [src]!</span>")
		health -= 100
		healthcheck(1, 1, user)

/obj/structure/fence/attackby(obj/item/W, mob/user)

	if(istype(W, /obj/item/stack/rods) && health < health_max)
		var/obj/item/stack/rods/R = W
		var/amount_needed = 2
		if(health)
			amount_needed = 1
		if(R.amount >= amount_needed)
			user.visible_message("<span class='notice'>[user] starts repairing [src] with [R].</span>",
			"<span class='notice'>You start repairing [src] with [R]")
			playsound(src.loc, 'sound/items/Wirecutter.ogg', 25, 1)
			if(do_after(user, 30, TRUE, 5))
				if(R.amount < amount_needed)
					user << "<span class='warning'>You need more metal rods to repair [src]."
					return
				R.use(amount_needed)
				health = health_max
				cut = 0
				density = 1
				update_icon()
				playsound(loc, 'sound/items/Wirecutter.ogg', 25, 1)
				user.visible_message("<span class='notice'>[user] repairs [src] with [R].</span>",
				"<span class='notice'>You repair [src] with [R]")
				return
		else
			user << "<span class='warning'>You need more metal rods to repair [src]."
			return

	if(cut) //Cut/brokn grilles can't be messed with further than this
		return

	if(istype(W, /obj/item/weapon/wirecutters))
		user.visible_message("<span class='notice'>[user] starts cutting through [src] with [W].</span>",
		"<span class='notice'>You start cutting through [src] with [W]")
		playsound(src.loc, 'sound/items/Wirecutter.ogg', 25, 1)
		if(do_after(user, 20, TRUE, 5))
			playsound(loc, 'sound/items/Wirecutter.ogg', 25, 1)
			user.visible_message("<span class='notice'>[user] cuts through [src] with [W].</span>",
			"<span class='notice'>You cut through [src] with [W]")
			cut_grille()
		return
	else
		switch(W.damtype)
			if("fire")
				health -= W.force
			if("brute")
				health -= W.force * 0.1
		healthcheck(1, 1, user, W)
		..()

/obj/structure/fence/proc/cut_grille(var/create_debris = 1)
	if(create_debris)
		new /obj/item/stack/rods(loc)
	cut = 1
	density = 0
	update_icon() //Make it appear cut through!

/obj/structure/fence/New(Loc, start_dir = null, constructed = 0)
	..()

	if(start_dir)
		dir = start_dir

	update_nearby_icons()

/obj/structure/fence/Move()
	var/ini_dir = dir
	..()
	dir = ini_dir

//This proc is used to update the icons of nearby windows.
/obj/structure/fence/proc/update_nearby_icons()
	update_icon()
	for(var/direction in cardinal)
		for(var/obj/structure/fence/W in get_step(src, direction))
			W.update_icon()

//merges adjacent full-tile windows into one (blatant ripoff from game/smoothwall.dm)
/obj/structure/fence/update_icon()
	//A little cludge here, since I don't know how it will work with slim windows. Most likely VERY wrong.
	//this way it will only update full-tile ones
	//This spawn is here so windows get properly updated when one gets deleted.
	spawn(2)
		if(!src) return
		for(var/obj/structure/fence/W in orange(src, 1))
			if(abs(x - W.x) - abs(y - W.y)) //Doesn't count grilles, placed diagonally to src
				junction |= get_dir(src, W)
		if(cut)
			icon_state = "broken[basestate][junction]"
		else
			icon_state = "[basestate][junction]"

/obj/structure/fence/fire_act(exposed_temperature, exposed_volume)
	if(exposed_temperature > T0C + 800)
		health -= round(exposed_volume / 100)
		healthcheck(0) //Don't make hit sounds, it's dumb with fire/heat
	..()
