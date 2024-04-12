#!/bin/bash

### Variables.

    # Primer Personaje
    vida_1=100
    atk_1=5
    def_1=10 #Es un porcentaje

    # Segundo personaje
    vida_2=200
    atk_2=1
    def_2=3

    # Boss
    boss_hp=100
    boss_atk=(5-25)
    boss_def=12

    frase_azar=(0-6)
    
    frase_azar_1="Coma Flotante-kun: ¡Deja de molestarme, estoy leyendo Berserk!" 
    frase_azar_2="Coma Flotante-kun: ¿Sabías que la mejor parte de los animes es el fanservice?"
    frase_azar_3="Coma Flotante-kun: Estoy deseando acabar esta pelea para volver a verme Sword Art Online por cuarta vez."
    frase_azar_4="Coma Flotante-kun: No lo entiendes, no ducharnos es nuestro mecanismo de supervivencia."
    frase_azar_5="Coma Flotante-kun: ¡Deja ya de reírte! No me puedo concentrar..."
    frase_azar_6="Coma Flotante-kun: No sé qué es más dolorosa, esta pelea o ver todo el relleno de Naruto."
    frase_azar_7="Coma Flotante-kun: Si es que en vez de ser otaku debería de haberme puesto a jugar al Minecraft..."


    # Menu
    mochila_pocion=0
    mochila_fuerza=0
    huir=0


    # Ataques
    fire=2
    earth=2
    water=4
    full_percent=100
    
### Fin de Variables


### ORDEN
# Inicio
# Fin
# Check_win
# Fight
# Leave
# Boss_turn
# Character
# Real_Ending
# Bag
# My_turn
###



### Inicio
inicio() {
echo ¡Bienvenido a Final Otaku!
echo En este juego manejarás a dos legendarios guerreros para vencer el mal otaku.

echo ¿Con qué personaje deseas empezar?
echo 1. Espadachín Okay Pepe
echo Un legendario espadachín con estadísticas equilibradas. Es el hermano de la famosa Alexa Amazon.
echo "--------------------------------------------------------------"
echo 2. Guardián Dani el Pensante
echo Las leyendas cuentan que piensa tanto, que no procesa el daño que recibe. Tiene poco ataque y defensa pero mucha vida. 
echo "--------------------------------------------------------------"
read -r inicio_character
if [[ ( $inicio_character -lt 1 ) && ( $inicio_character -gt 2 )]]; then # Si el valor es menor de 1 y mayor que 2, seleccionas a Pepe.
    echo Este personaje no existe. Se usará a Espadachín Okay Pepe.
    character_on_play=1
    my_turn
else
    character_on_play=$inicio_character
    my_turn
fi
}




### Final Checks

# Victoria check

fin() {
    if [[ $boss_hp -le 0 && $logro_4 -eq 1 && $logro_2 -eq 1 && $logro_3 -eq 1 && $logro_5 -ne 1 ]]; then
    echo ¿Te gustaría volver a intentarlo?
    read -r
    echo ¿Te gustaría intentar hacer las cosas de otra manera?
    read -r
    echo 1. Tan sólo quiero volver a jugar.
    echo 2. No, no quiero volver a jugar.
    echo 3. Sí, pero esta vez prometo que será la última.
    read -r ending_choose
    case $ending_choose in
    1) inicio ;;
    2) exit ;;
    3) 
        secret=1
        inicio
        ;;
    *) echo Elige una opción válida
        fin
    esac
    fi

    echo ¿Te gustaría volver a jugar?
    read -r ending_choose
    case $ending_choose in
    1) inicio ;;
    2) exit ;;
    *) echo Elige una opción válida
        fin
    esac
}




check_win() {
    if [[ $boss_hp -le 0 && $logro_1 -eq 1 && $logro_2 -eq 1 && $logro_3 -eq 1 ]]; then
        echo Coma Flotante-kun se desploma al suelo.
        read -r
        echo Escuchas sollozos. Lo ves alzando la mano hacia el horizonte con lo que parece ser lágrimas en sus ojos.
        read -r
        echo ¿Por qué tengo esta mala suerte?
        read -r
        echo ¿No podías simplemente correr hacia otro lado? Te habría dejado escapar... lo sabes... lo hemos hecho miles de veces.
        read -r
        echo O igual no. Pero sé que no sirve de nada explicártelo. Siempre es lo mismo.
        read -r
        echo ¿Por qué tuve que nacer aquí? No... ¿Por qué tuvimos que nacer aquí?
        read -r
        echo Vivimos en este bucle infinito en el que yo muero o te salvo antes de que mueras.
        read -r
        echo Pero cuando te salvo, el ciclo se reinicia... y no recuerdas nada.
        read -r
        echo Cuando muero es lo mismo excepto que yo sí tengo recuerdos.
        read -r
        echo Recuerdo todas las veces que me has matado. También recuerdo todas las veces que te he salvado, y las pocas veces en las que por suerte, te da por huir del combate.
        read -r
        echo Esas son mis favoritas. Un reinicio sin dolor. A veces me da por llorar de alegría.
        read -r
        echo Ahora que vamos a volver a ser reiniciados y no vas a recordar nada, déjame hacerte una pregunta.
        read -r
        echo ¿Estás orgulloso?
        read -r
        echo ¿Estás orgulloso de tu elección?
        read -r
        echo Coma Flotante-kun ha muerto.
        echo ¡Has ganado!
        echo "Has obtenido [Final 4: El Bucle]"
        logro_4=1
        fin
    fi

    if [[ $boss_hp -le 0 ]]; then
        echo Coma Flotante-kun se desploma al suelo.
        read -r
        echo Escuchas sollozos.
        read -r
        echo ¿Por qué tengo esta mala suerte?
        read -r
        echo ¿No podías simplemente correr hacia otro lado? Te habría dejado escapar...
        read -r
        echo Lo sabes...
        read -r
        echo O igual no. Pero sé que no sirve de nada explicártelo.
        read -r
        echo Coma Flotante-kun ha muerto.
        echo ¡Has ganado!
        echo "Has obtenido [Final 1: Bañar el Otaku]"
        logro_1=1
    else
        boss_turn
    fi
}
###



### Atacar
fuego () {
    echo Al grito de "MUERE BICHO" haces tremendo lanzallamas encendiendo un bote de insecticida con un mechero.
    echo ¡Es efectivo!
    echo Haces $(( (current_atk * fire ) * ( full_percent - boss_def ) / full_percent )) de daño de fuego.
    echo Coma Flotante-kun tiene ahora $(( boss_hp - ( ( current_atk * fire ) * ( full_percent - boss_def ) / full_percent ) )) de vida.
    boss_hp=$(( boss_hp - ( ( current_atk * fire ) * ( full_percent - boss_def ) / full_percent ) ))
    check_win
}

aire () {
    echo Soplas fuertemente hacia el enemigo.
    echo No es muy efectivo... 
    echo Salvo despeinarle, no le has hecho nada.
    check_win
}

tierra() {
    echo Buscas una piedra para tirársela, pero una piedra grande.
    echo No es efectivo...
    echo Haces $(( (current_atk / earth ) * ( full_percent - boss_def ) / full_percent )) de daño de tierra.
    echo Coma Flotante-kun tiene ahora $(( boss_hp - ( ( current_atk / earth ) * ( full_percent - boss_def ) / full_percent ) )) de vida.
    boss_hp=$(( boss_hp - ( ( current_atk / earth ) * ( full_percent - boss_def ) / full_percent ) ))
    check_win
}

agua() {
    echo Al recibir tremendo olor a otaku, haces la danza de la lluvia.
    echo ¡Es muy efectivo!
    echo Haces $(( (current_atk * water ) * ( full_percent - boss_def ) / full_percent )) de daño de agua.
    echo Coma Flotante-kun tiene ahora $(( boss_hp - ( ( current_atk * water ) * ( full_percent - boss_def ) / full_percent ) )) de vida.
    boss_hp=$(( boss_hp - ( ( current_atk * water ) * ( full_percent - boss_def ) / full_percent ) ))
    check_win
}

fight() {
    echo Has seleccionado Lucha.
    echo ¿Con qué elemento deseas atacar?
    echo 1. Fuego. 2. Aire. 3. Tierra. 4. Agua. 5. Volver.
    read -r choose_atk
    case $choose_atk in
        1) fuego ;;
        2) aire ;;
        3) tierra ;;
        4) agua ;;
        6) my_turn ;;
        *) echo Introduce un valor correcto
        fight
    esac
}
###






## Huir
leave() {
    echo Recibes un Whatsapp de tu pareja diciéndote de que está sola en casa.
    read -r
    echo ¡Escapas exitosamente de la pelea!
    read -r
    echo Coma Flotante-kun se queda llorando en un rincón...
    echo "Has obtenido [Final 3]"
    huir=$((huir+1))
    logro_3=1
    fin
}




### Turno del Boss
boss_turn() {
    echo Turno de Coma Flotante-kun.
    boss_atk_done=$((RANDOM%boss_atk))

    numero_azar=$((RANDOM%frase_azar))

    if [[ $numero_azar -eq 0 ]]; then
        echo "$frase_azar_1"
    fi
    if [[ $numero_azar -eq 1 ]]; then
        echo "$frase_azar_2"
    fi
    if [[ $numero_azar -eq 2 ]]; then
        echo "$frase_azar_3"
    fi
    if [[ $numero_azar -eq 3 ]]; then
        echo "$frase_azar_4"
    fi
    if [[ $numero_azar -eq 4 ]]; then
        echo "$frase_azar_5"
    fi
    if [[ $numero_azar -eq 5 ]]; then
        echo "$frase_azar_6"
    fi
    if [[ $numero_azar -eq 6 ]]; then
        echo "$frase_azar_7"
    fi

    echo ¡Coma Flotante-kun lanza Precisión Cuádruple!
    echo Hace $boss_atk_done de daño.
    echo Te quedan $(( current_hp - boss_atk_done )) de vida.
    current_hp=$(( current_hp - boss_atk_done ))

    # Matar a Pepe
    if [[ ( $character_on_play -eq 1 ) && ( $current_hp -le 0 ) ]]; then ## Pepe
        echo "$character_name" ha muerto.
        read -r
        echo No te olvides de encargar uno nuevo por Amazon Prime.
        read -r
        character_on_play=2 
        vida_1=0
        my_turn
    fi

    # Matar a Dani
    if [[ ( $character_on_play -eq 2 ) && ( $current_hp -le 0 ) ]]; then ## Dani
        echo "$character_name" ha muerto.
        read -r
        echo El Guardián Dani el Pensador ha muerto pero sus preguntas siempre vivirán en nuestros corazones.
        read -r
        character_on_play=1
        vida_2=0
        my_turn
    fi

    # Derrota Check
    if [[ $vida_1 -le 0 ]]; then
        if [[ $vida_2 -le 0 ]]; then
            echo Has perdido...
            read -r
            echo Justo cuando "$character_name" está por caer al suelo, una mano le sujeta.
            read -r
            echo "[Final 2: Aprende a Jugar Crack]"
            logro_2=1
            fin
        fi
    fi
}
###





##
character() {
    echo Has seleccionado la opción de cambiar de personaje.
    echo 1. Espadachín Okay Pepe.
    echo Un legendario espadachín con estadísticas equilibradas. Es el hermano de Alexa.
    echo "--------------------------------------------------------------"
    echo 2. Guardián Dani el Pensante.
    echo Las leyendas cuentan que piensa tanto, que no procesa el daño que recibe. Tiene poco ataque y defensa pero mucha vida. 
    echo "--------------------------------------------------------------"
    echo 3. Volver.
    echo ¿Qué personaje vas a utilizar?
    read -r choose_personaje
    if [[ $character_on_play -eq 1 &&  $choose_personaje -eq 1 ]]; then 
        echo Ya estás usando a Espadachín Okay Pepe.
        my_turn 
    else 
        echo Has seleccionado Espadachín Okay Pepe.
        vida_2=$current_hp
        current_atk=$atk_1
        current_def=$def_1
        character_on_play=1
        boss_turn
    fi

    if [[ $character_on_play -eq 2 &&  $choose_personaje -eq 2 ]]; then
                echo Ya estás usando a Guardián Dani el Pensante.
                my_turn
    else
                echo Has seleccionado Guardián Dani el Pensante.
                vida_1=$current_hp
                current_atk=$atk_2
                current_def=$def_2
                character_on_play=2
                boss_turn
    fi

    if [[ $choose_personaje -eq 3 ]]; then
        my_turn 
    fi

    if [[ $choose_personaje -ge 4 ]]; then
        echo Introduce un valor válido
        character
    fi
}



### Real Ending
real_ending() {
    echo ¿Qué es esto?
    read -r
    echo ¿Un manga de One Piece?
    read -r
    echo "Pero, ¿Por qué me lo has tirado? ¿Es para mí? (SI/NO)"
    read -r real_answer
    if [[ $real_answer = SI ]]; then
        echo "¿En serio? (SI/NO)"
        read -r real_answer
        if [[ $real_answer = SI ]]; then
            echo "No me engañes por favor... (ES PARA TI/NO ES PARA TI)"
            read -r real_answer 
                if [[ $real_answer = "ES PARA TI" ]]; then
                    echo Vale, vale... Entonces le echaré un ojo si no te importa.
                    read -r
                    echo ¡Tiene varias hojas a color!
                    read -r
                    echo ¿Está firmado? ¿No es esta la firma de Eiichiro Oda, el creador de One Piece? Imposible...
                    read -r
                    echo "¿Qué? ¿Qué por qué estoy llorando? No estoy llorando... ¡Son mentiras y calumnias! (SI ESTAS LLORANDO/NO ESTAS LLORANDO)"
                    read -r real_answer
                    if [[ $real_answer = "SI ESTAS LLORANDO" ]]; then
                        echo Vale, es verdad...
                        .sleep 1s
                        echo Pero es que el regalo es tan bueno...
                        read -r
                        echo Todo este tiempo pensaba que estaba solo. Gracias por el regalo.
                        read -r
                        echo Aunque permaneceremos eternamente en un ciclo lleno de muerte y sufrimiento, tu regalo me dará fuerzas para recordar que no estoy solo.
                        read -r
                        echo Para recordar de que, al menos una vez durante los infinitos ciclos, obtuve un amigo.
                        read -r
                        echo Toma también este regalo de mi parte, mi amigo.
                        read -r
                        echo Aunque no queda mucho tiempo para el siguiente reinicio, y después de esto lo olvidarás todo nuevamente, espero que este regalo ayude a que nuestros caminos vuelvan a juntarse.
                        echo "Has obtenido [Final Real: No estás solo]"
                        logro_5=1
                        logro_4=0
                        logro_3=0
                        logro_2=0
                        logro_1=0
                        secret=0
                        read -r
                        echo Aquí viene. Adiós amigo.
                        read -r
                        fin
                    else
                        echo Gracias por entenderlo...
                        .sleep 1s
                        echo El regalo es tan bueno... Muchas gracias, de verdad.
                        read -r
                        echo Todo este tiempo pensaba que estaba solo.
                        read -r
                        echo Aunque estamos en un ciclo eterno de muerte y sufrimiento, tu regalo me dará fuerzas para recordar que no estoy solo.
                        read -r
                        echo Para recordar de que, al menos una vez durante los infinitos ciclos, obtuve un amigo.
                        read -r
                        echo Toma también este regalo de mi parte, mi amigo.
                        read -r
                        echo Aunque no queda mucho tiempo para el siguiente reinicio, y después de esto lo olvidarás todo nuevamente, espero que este regalo ayude a que nuestros caminos vuelvan a juntarse.
                        echo "Has obtenido [Final 5: No estás solo]"
                        logro_5=1
                        logro_4=0
                        logro_3=0
                        logro_2=0
                        logro_1=0
                        secret=0
                        read -r
                        echo Aquí viene. Adiós amigo.
                        read -r
                        fin
                    fi
                else
                    echo Has roto mi corazón...
                    read -r
                    logro_4=0
                    logro_3=0
                    logro_2=0
                    logro_1=0
                    secret=0
                    fin
                fi
        else
            echo ¡Vaya forma de gastarme una broma!
            read -r
            logro_4=0
            logro_3=0
            logro_2=0
            logro_1=0
            secret=0
            fin
        fi
    else
        echo Sabía que esto no era para mí... Soy un iluso
        read -r
        logro_4=0
        logro_3=0
        logro_2=0
        logro_1=0
        secret=0
        fin
    fi

}





## Mochila
bag() {
    echo Has abierto la mochila.

    if [[ $secret -eq 1 ]]; then
        echo 1. Poción de vida.
        echo 2. Poción de ataque.
        echo 3. Volver
        echo 4̷̭͖́̑.̸̡̔̆ ̵̜͆͜1̴̯̥̑̚x̴̙͔̿ ̵̠͊O̷̥̞̊̌n̷̮̐e̷̗͐͋ ̶͎͍̀̄P̴̲̹͊ḯ̴͕͚́ė̶͔͕͐c̶̺̾̒ě̸̬̈́ ̸̫͝M̸̡̆ȁ̷̡͙n̴̝͖̓̿ģ̷̃͝a̶̼̬̋.̷̷̨͖̩̩̮̻̝̥͙̝̀̾̑
        read -r choose_mochila
        if [[ $choose_mochila -eq 1 ]]; then
            echo La poción de vida no está disponible.
            bag
        fi
        if [[ $choose_mochila -eq 2 ]]; then
            echo La poción de ataque no está disponible.
            bag
        fi
        if [[ $choose_mochila -eq 3 ]]; then
            my_turn
        fi
        if [[ $choose_mochila -eq 4 ]]; then
            echo L̴̟͔̆a̶͇̩͗̂n̷̤̓ż̸̦̝a̸̛ͅș̴̇ ̵̛̺e̶̩̍l̷̡͙̚ ̴̤͐m̵̞̳͒ä̶̝̐n̷͎̹̑̑ḡ̶̮͕͛a̶̢̔̏ ̶̺̹̚h̵̃͜a̵͖̓̀c̸̡̾̚i̵̥͍̎a̸͚͠ ̷̮̦́C̸̹͝o̴̖̹̓m̴̙̄͋ͅa̷̮̗̓ ̷̥̒F̵͈̥̆l̴̦͓͐o̶̪̖͑̿t̴̢̛̰̀a̷̲̼̋̇n̸̩͘t̵̗̬̋ė̴͈̔-̶͙̼͋k̴̹͎̍͝u̸̼̞̿͛ṅ̸̥̼͑.̵͖͐
            read -r
            real_ending
        fi
        if [[ $choose_mochila -eq 4 ]]; then
            echo Introduce un valor válido.
            bag
        fi
    fi
    # No se ha usado objetos
    if [[ ( $mochila_pocion -eq 0 ) && ( $mochila_fuerza -eq 0 ) ]]; then
        echo 1. Poción de vida. 2. Poción de Ataque. 3. Volver 
        # Poción de ataque = x2 durante todo el combate.
        echo ¿Qué objeto deseas usar?
        read -r choose_mochila
        if [[ $choose_mochila -eq 1 ]]; then
            echo Coges la poción de vida y te la bebes.
            echo Tras beber la poción te das cuenta de que es un bote del jarabe Dalsy.
            echo Te has curado un 50% de la vida.
            current_hp=$(( (( current_hp * 50 ) / 100 ) + current_hp ))
            mochila_pocion=$(( mochila_pocion + 1 ))
            echo Has consumido 1 poción de vida.
            boss_turn
        fi
        if [[ $choose_mochila -eq 2 ]]; then
            echo Te tomas la poción de ataque.
            echo Desafortunadamente te sienta mal y te entra diarrea, por lo que decides terminar el combate lo antes posible para poder ir al baño.
            echo Ahora tu personaje hará x2 más de daño durante todo el combate.
            current_atk=$(( current_atk * 2 ))
            mochila_fuerza=$(( mochila_fuerza + 1 ))
            echo Has consumido 1 poción de ataque.
            boss_turn
        fi
        if [[ $choose_mochila -eq 3 ]]; then
            my_turn
        fi
        if [[ $choose_mochila -gt 3 ]];
        then
            echo Introduce un valor válido.
            bag 
        fi
    fi

    
    # Se ha usado la poción y la fuerza
    if [[ ( $mochila_pocion -eq 1 ) && ( $mochila_fuerza -eq 1 ) ]]; then
    echo No tienes objetos en la mochila.
    bag
    fi

    # Se ha usado la poción de vida
    if [[ ( $mochila_pocion -eq 1 ) && ( $mochila_fuerza -eq 0 ) ]]; then
        echo 1. Poción de Ataque. 2. Volver. # Poción de ataque = x2 durante todo el combate.
        echo ¿Qué objeto deseas usar?
        read -r choose_mochila
        if [[ $choose_mochila -eq 1 ]]; then
            echo Te tomas la poción de ataque.
            echo Desafortunadamente te sienta mal y te entra diarrea, por lo que decides terminar el combate lo antes posible para poder ir al baño.
            echo Ahora tu personaje hará x2 más de daño durante todo el combate.
            current_atk=$(( current_atk * 2 ))
            mochila_fuerza=$(( mochila_fuerza + 1 ))
            echo Has consumido 1 poción de ataque.
            boss_turn
        fi
        if [[ $choose_mochila -eq 2 ]]; then
            my_turn
        fi
        if [[ $choose_mochila -gt 2 ]];
        then
            echo Introduce un valor válido.
            bag 
        fi
    fi

    # Se ha usado la poción de fuerza
    if [[ ( $mochila_pocion -eq 0 ) && ( $mochila_fuerza -eq 1 ) ]]; then
        echo 1. Pocion de vida. 2. Volver.
        echo ¿Qué objeto deseas usar?
        read -r choose_mochila
        if [[ $choose_mochila -eq 1 ]]; then
            echo Coges la poción de vida y te la bebes.
            echo Tras beber la poción te das cuenta de que es un bote del jarabe Dalsy.
            echo Te has curado un 50% de la vida.
            current_hp=$(( (( current_hp * 50 ) / 100 ) + current_hp ))
            mochila_pocion=$(( mochila_pocion + 1 ))
            echo Has consumido 1 poción de vida.
            boss_turn
        fi
        if [[ $choose_mochila -eq 2 ]]; then
            my_turn
        fi
        if [[ $choose_mochila -gt 2 ]];
        then
            echo Introduce un valor válido.
            bag 
        fi
    fi



}
##



### Combate: Mi Turno
my_turn() {
    ## Comprobación del personaje
    if [[ $character_on_play -eq 1 ]]; then
        character_name="Espadachín Okay Pepe"
        current_hp=$vida_1
        current_atk=$atk_1
        current_def=$def_1
    else
        character_name="Guardián Dani el Pensante"
        current_hp=$vida_2
        current_atk=$atk_2
        current_def=$def_2
    fi
    echo ______________________________
    echo Personaje: "$character_name"
    echo Vida: $current_hp
    echo Ataque: $current_atk
    echo Defensa: $current_def
    echo ______________________________
    echo Boss: Coma Flotante-kun
    echo Vida: $boss_hp
    echo Ataque: 5-25
    echo Defensa: $boss_def
    echo ______________________________
    echo
    echo Es tu turno.
    echo 1. Lucha. 2. Personaje. 3. Mochila. 4. Huir
    echo ¿Qué quieres hacer?
    read -r choose
    if [[ $choose -eq 1 ]]; then
        fight
    fi
    if [[ $choose -eq 2 ]]; then
        character
    fi
    if [[ $choose -eq 3 ]]; then
        bag
    fi
    if [[ $choose -eq 4 ]]; then
        leave
    fi
    if [[ $choose -ge 5 ]]; then
        echo Introduce un valor correcto
        my_turn
    fi
}
###


inicio