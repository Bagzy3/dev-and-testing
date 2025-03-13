from random import randint

pdv_hero = 50
pdv_badman = 50
nombre_potions = 3



while pdv_hero > 0:

    choix = input("Souhaitez-vous attaquer (1) ou utiliser une potion (2) ?").strip()
   
    if choix.isdigit() and ( choix == "1" or choix == "2" ):
    
        if choix == "1" : 

            attaque_hero = randint(5,10)
            pdv_badman -= attaque_hero

            print(f"Vous avez infligé {attaque_hero} points de dégats à l'ennemi ! ")

            attaque_badman = randint(5,15)
            pdv_hero -= attaque_badman

            if pdv_badman <= 0:
                print(f"Tu as gagné et il te reste {pdv_hero} PV !")
                break
            elif pdv_hero <= 0:
                print(f"L'ennemi vous a infligé {attaque_badman} points de dégats !")
                print(f"Tu as perdu il reste {pdv_badman} PV à l'ennemi !")    
                break
            else:
                print(f"L'ennemi vous a infligé {attaque_badman} points de dégats !")
                print(f"Il vous reste {pdv_hero} points de vie ! ")
                print(f"Il reste {pdv_badman} points de vie à l'ennemi ! ")
                print("-----------------------------------------------------------------------")

        elif choix == "2" :

            if nombre_potions > 0 :

                nombre_potions -= 1
                regen_potion = randint(15,50)
                pdv_hero += regen_potion
                print(f"Vous récupérez {regen_potion} points de vie ! ( il vous reste {nombre_potions} potions )")

                attaque_badman = randint(5,15)
                pdv_hero -= attaque_badman
                print(f"L'ennemi vous a infligé {attaque_badman} points de dégats !")
                print(f"Il vous reste {pdv_hero} points de vie ! ")
                print(f"Il reste {pdv_badman} points de vie à l'ennemi ! ")
                print("-----------------------------------------------------------------------")

                print(f"Vous passez votre tour ...")
                attaque_badman = randint(5,15)
                pdv_hero -= attaque_badman
                print(f"L'ennemi vous a infligé {attaque_badman} points de dégats !")
                print(f"Il vous reste {pdv_hero} points de vie ! ")
                print(f"Il reste {pdv_badman} points de vie à l'ennemi ! ")
                print("-----------------------------------------------------------------------")

            else :
                print("Vous n'avez plus de potions !")
            
    else:
        continue

print("Fin du jeu")