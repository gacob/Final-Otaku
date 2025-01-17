#!/bin/bash

### Variables

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
    echo ____________________________________________________________________________________
    echo ¡Bienvenido a Final Otaku!
    sleep 1
    echo En este juego manejarás a dos legendarios guerreros para vencer el mal otaku.
    sleep 1
    echo
    echo ¿Con qué personaje deseas empezar?
    echo
    echo ____________________________________________________________________________________
    echo 
    echo 1. Espadachín Okay Pepe
    echo Un legendario espadachín con estadísticas equilibradas. Es el hermano de la famosa Alexa Amazon.
    echo 
    echo ____________________________________________________________________________________
    echo 
    echo 2. Guardián Dani el Pensante
    echo Las leyendas cuentan que piensa tanto, que no procesa el daño que recibe. Tiene poco ataque y defensa pero mucha vida. 
    echo 
    echo ____________________________________________________________________________________
    echo 
    read -r inicio_character
    if [[ ( $inicio_character -lt 1 ) || ( $inicio_character -gt 2 )]]; then # Si el valor es menor de 1 o mayor que 2, seleccionas a Pepe.
        echo Este personaje no existe. Se usará a Espadachín Okay Pepe.
        echo 
        sleep 1
        character_on_play=1
        inicio_character=0
        my_turn
    else
        character_on_play=$inicio_character
        inicio_character=0
        my_turn
    fi
}




### Final Checks

# Victoria check

fin() {
    if [[ $boss_hp -le 0 && $logro_4 -eq 1 && $logro_2 -eq 1 && $logro_3 -eq 1 && $logro_5 -ne 1 ]]; then
    echo ¿Te gustaría volver a intentarlo?
    sleep 1
    echo ¿Te gustaría intentar hacer las cosas de otra manera?
    sleep 1
    echo 1. Tan sólo quiero volver a jugar.
    echo 2. No, no quiero volver a jugar.
    echo 3. Sí, pero esta vez prometo que será la última.
    read -r ending_choose
    case $ending_choose in
    1) 
        ending_choose=0
        inicio ;;
    2) exit ;;
    3) 
        ending_choose=0
        secret=1
        sleep 1
        inicio
        ;;
    *) echo Elige una opción válida
        sleep 1
        ending_choose=0
        fin
    esac
    fi

    echo ¿Te gustaría volver a jugar?
    sleep 1
    echo 1. Sí.
    echo 2. No.
    read -r ending_choose
    case $ending_choose in
    1) 
        ending_choose=0
        sleep 1
        inicio ;;
    2) 
        ending_choose=0
        exit ;;
    *) echo Elige una opción válida
        sleep 1
        ending_choose=0
        fin
    esac
}




check_win() {
    if [[ $boss_hp -le 0 && $logro_1 -eq 1 && $logro_2 -eq 1 && $logro_3 -eq 1 ]]; then
        echo Coma Flotante-kun se desploma al suelo.
        sleep 1
        echo Escuchas sollozos. Lo ves alzando la mano hacia el horizonte con lo que parece ser lágrimas en sus ojos.
        sleep 1
        echo ¿Por qué tengo esta mala suerte?
        sleep 1
        echo ¿No podías simplemente correr hacia otro lado? Te habría dejado escapar... lo sabes... lo hemos hecho miles de veces.
        sleep 1
        echo O igual no. Pero sé que no sirve de nada explicártelo. Siempre es lo mismo.
        sleep 1
        echo ¿Por qué tuve que nacer aquí? No... ¿Por qué tuvimos que nacer aquí?
        sleep 1
        echo Vivimos en este bucle infinito en el que yo muero o te salvo antes de que mueras.
        sleep 1
        echo Pero cuando te salvo, el ciclo se reinicia... y no recuerdas nada.
        sleep 1
        echo Cuando muero es lo mismo excepto que yo sí tengo recuerdos.
        sleep 1
        echo Recuerdo todas las veces que me has matado. También recuerdo todas las veces que te he salvado, y las pocas veces en las que por suerte, te da por huir del combate.
        sleep 1
        echo Esas son mis favoritas. Un reinicio sin dolor. A veces me da por llorar de alegría.
        sleep 1
        echo Ahora que vamos a volver a ser reiniciados y no vas a recordar nada, déjame hacerte una pregunta.
        sleep 1
        echo ¿Estás orgulloso?
        sleep 1
        echo ¿Estás orgulloso de tu elección?
        sleep 1
        echo Coma Flotante-kun ha muerto.
        echo ¡Has ganado!
        echo "Has obtenido [Final 4: El Bucle]"
        sleep 1
        logro_4=1
        fin
    fi

    if [[ $boss_hp -le 0 ]]; then
        echo Coma Flotante-kun se desploma al suelo.
        sleep 1
        echo Escuchas sollozos.
        sleep 1
        echo ¿Por qué tengo esta mala suerte?
        sleep 1
        echo ¿No podías simplemente correr hacia otro lado? Te habría dejado escapar...
        sleep 1
        echo Lo sabes...
        sleep 1
        echo O igual no. Pero sé que no sirve de nada explicártelo.
        sleep 1
        echo Coma Flotante-kun ha muerto.
        echo ¡Has ganado!
        echo "Has obtenido [Final 1: Bañar el Otaku]"
        sleep 1
        logro_1=1
    else
        boss_turn
        sleep 1
    fi
}
###



### Atacar
fuego () {
    echo 
    echo Al grito de "MUERE BICHO" haces tremendo lanzallamas encendiendo un bote de insecticida con un mechero.
    sleep 1
    echo 
    echo ¡Es efectivo!
    echo 
    sleep 1
    echo Haces $(( (current_atk * fire ) * ( full_percent - boss_def ) / full_percent )) de daño de fuego.
    echo Coma Flotante-kun tiene ahora $(( boss_hp - ( ( current_atk * fire ) * ( full_percent - boss_def ) / full_percent ) )) de vida.
    boss_hp=$(( boss_hp - ( ( current_atk * fire ) * ( full_percent - boss_def ) / full_percent ) ))
    choose_atk=0
    check_win
}

aire () {
    echo 
    echo Soplas fuertemente hacia el enemigo.
    sleep 1
    echo 
    echo No es muy efectivo... 
    sleep 1
    echo 
    echo Salvo despeinarle, no le has hecho nada.
    sleep 1
    echo 
    choose_atk=0
    check_win
}

tierra() {
    echo 
    echo Buscas una piedra para tirársela, pero una piedra grande.
    sleep 1
    echo 
    echo No es efectivo...
    sleep 1
    echo 
    echo Haces $(( (current_atk / earth ) * ( full_percent - boss_def ) / full_percent )) de daño de tierra.
    sleep 1
    echo 
    echo Coma Flotante-kun tiene ahora $(( boss_hp - ( ( current_atk / earth ) * ( full_percent - boss_def ) / full_percent ) )) de vida.
    sleep 1
    echo 
    boss_hp=$(( boss_hp - ( ( current_atk / earth ) * ( full_percent - boss_def ) / full_percent ) ))
    choose_atk=0
    check_win
}

agua() {
    echo 
    echo Al recibir tremendo olor a otaku, haces la danza de la lluvia.
    sleep 1
    echo 
    echo ¡Es muy efectivo!
    sleep 1
    echo 
    echo Haces $(( (current_atk * water ) * ( full_percent - boss_def ) / full_percent )) de daño de agua.
    sleep 1
    echo 
    echo Coma Flotante-kun tiene ahora $(( boss_hp - ( ( current_atk * water ) * ( full_percent - boss_def ) / full_percent ) )) de vida.
    sleep 1
    echo 
    boss_hp=$(( boss_hp - ( ( current_atk * water ) * ( full_percent - boss_def ) / full_percent ) ))
    choose_atk=0
    check_win
}

fight() {
    echo 
    echo Has seleccionado Lucha.
    sleep 1
    echo ¿Con qué elemento deseas atacar?
    sleep 1
    echo 1. Fuego.  2. Aire.
    echo 3. Tierra. 4. Agua 
    echo 5. Volver.
    sleep 1
    read -r choose_atk
    case $choose_atk in
        1) fuego ;;
        2) aire ;;
        3) tierra ;;
        4) agua ;;
        6) my_turn ;;
        *) echo Introduce un valor correcto
            choose_atk=0
            fight
    esac
}
###






## Huir
leave() {
    echo Recibes un Whatsapp de tu pareja diciéndote que está sola en casa.
    sleep 1
    echo ¡Escapas exitosamente de la pelea!
    sleep 1
    echo Coma Flotante-kun se queda llorando en un rincón...
    echo "Has obtenido [Final 3]"
    sleep 1
    huir=$((huir+1))
    logro_3=1
    fin
}




### Turno del Boss
boss_turn() {
    echo Turno de Coma Flotante-kun.

    boss_atk_done=$((RANDOM%boss_atk + 5))

    # Se coge un INT al azar de un array del 0-6, se guardan y generan una frase según sea su valor.
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

    ## Turno del Boss
    sleep 1
    echo ________________________________________________________
    echo ¡Coma Flotante-kun lanza Precisión Cuádruple!
    echo ________________________________________________________
    sleep 1
    echo Hace $boss_atk_done de daño.
    sleep 1
    sleep 1
    current_hp=$(( current_hp - boss_atk_done ))

    if [[ $character_on_play -eq 1 ]]; then
        vida_1=$current_hp
    else
        vida_2=$current_hp
    fi

    # Matar a Pepe
    if [[ ( $character_on_play -eq 1 ) && ( $current_hp -le 0 ) ]]; then ## Pepe
        echo "$character_name" ha muerto.
        sleep 1
        echo No te olvides de encargar uno nuevo por Amazon Prime.
        sleep 1
        character_on_play=2 
        vida_1=0
        my_turn
    fi

    # Matar a Dani
    if [[ ( $character_on_play -eq 2 ) && ( $current_hp -le 0 ) ]]; then ## Dani
        echo "$character_name" ha muerto.
        sleep 1
        echo El Guardián Dani el Pensador ha muerto pero sus preguntas siempre vivirán en nuestros corazones.
        sleep 1
        character_on_play=1
        vida_2=0
        my_turn
    fi

    # Derrota Check
    if [[ $vida_1 -le 0 ]]; then
        if [[ $vida_2 -le 0 ]]; then
            echo Has perdido...
            sleep 1
            echo Justo cuando "$character_name" está por caer al suelo, una mano le sujeta.
            sleep 1
            echo "[Final 2: Aprende a Jugar Crack]"
            logro_2=1
            fin
        fi
    fi

    echo Te quedan $(( current_hp - boss_atk_done )) de vida.
    my_turn
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

    if [[ $choose_personaje -eq 1 && $vida_1 -gt 0 ]]; then   
        if [[ $character_on_play -eq 1 ]]; then 
            echo Ya estás usando a Espadachín Okay Pepe.
            choose_personaje=0
            my_turn 
        else 
            echo Has seleccionado Espadachín Okay Pepe.
            vida_2=$current_hp
            current_hp=$vida_1
            current_atk=$atk_1
            current_def=$def_1
            character_on_play=1
            choose_personaje=0
            boss_turn
        fi
    fi

    if [[ $choose_personaje -eq 2 && $vida_2 -gt 0 ]]; then
        if [[ $character_on_play -eq 2 ]]; then
                    echo Ya estás usando a Guardián Dani el Pensante.
                    choose_personaje=0
                    my_turn
        else
                    echo Has seleccionado Guardián Dani el Pensante.
                    vida_1=$current_hp
                    current_hp=$vida_2
                    current_atk=$atk_2
                    current_def=$def_2
                    character_on_play=2
                    choose_personaje=0
                    boss_turn
        fi
    fi

    if [[ $choose_personaje -eq 3 ]]; then
        choose_personaje=0
        my_turn 
    fi

    if [[ $choose_personaje -ge 4 && $choose_personaje -le 0 ]]; then
        echo Introduce un valor válido
        choose_personaje=0
        character
    fi
}



### Real Ending
real_ending() {
    echo ¿Qué es esto?
    sleep 1
    echo ¿Un manga de One Piece?
    sleep 1
    echo "Pero, ¿Por qué me lo has tirado? ¿Es para mí? (SI/NO)"
    read -r real_answer
    if [[ $real_answer = SI ]]; then
        real_answer=0
        echo "¿En serio? (SI/NO)"
        read -r real_answer
        if [[ $real_answer = SI ]]; then
            real_answer=0
            echo "No me engañes por favor... (ES PARA TI/NO ES PARA TI)"
            read -r real_answer 
                if [[ $real_answer = "ES PARA TI" ]]; then
                    real_answer=0
                    echo Vale, vale... Entonces le echaré un ojo si no te importa.
                    sleep 1
                    echo ¡Tiene varias hojas a color!
                    sleep 1
                    echo ¿Está firmado? ¿No es esta la firma de Eiichiro Oda, el creador de One Piece? Imposible...
                    sleep 1
                    echo "¿Qué? ¿Qué por qué estoy llorando? No estoy llorando... ¡Son mentiras y calumnias! (SI ESTAS LLORANDO/NO ESTAS LLORANDO)"
                    read -r real_answer
                    if [[ $real_answer = "SI ESTAS LLORANDO" ]]; then
                        real_answer=0
                        echo Vale, es verdad...
                        .sleep 1s
                        echo Pero es que el regalo es tan bueno...
                        sleep 1
                        echo Todo este tiempo pensaba que estaba solo. Gracias por el regalo.
                        sleep 1
                        echo Aunque permaneceremos eternamente en un ciclo lleno de muerte y sufrimiento, tu regalo me dará fuerzas para recordar que no estoy solo.
                        sleep 1
                        echo Para recordar de que, al menos una vez durante los infinitos ciclos, obtuve un amigo.
                        sleep 1
                        echo Toma también este regalo de mi parte, mi amigo.
                        sleep 1
                        echo Aunque no queda mucho tiempo para el siguiente reinicio, y después de esto lo olvidarás todo nuevamente, espero que este regalo ayude a que nuestros caminos vuelvan a juntarse.
                        echo "Has obtenido [Final Real: No estás solo]"
                        logro_5=1
                        logro_4=0
                        logro_3=0
                        logro_2=0
                        logro_1=0
                        secret=0
                        sleep 1
                        echo Aquí viene. Adiós amigo.
                        sleep 1
                        fin
                    else
                        echo Gracias por entenderlo...
                        real_answer=0
                        .sleep 1s
                        echo El regalo es tan bueno... Muchas gracias, de verdad.
                        sleep 1
                        echo Todo este tiempo pensaba que estaba solo.
                        sleep 1
                        echo Aunque estamos en un ciclo eterno de muerte y sufrimiento, tu regalo me dará fuerzas para recordar que no estoy solo.
                        sleep 1
                        echo Para recordar de que, al menos una vez durante los infinitos ciclos, obtuve un amigo.
                        sleep 1
                        echo Toma también este regalo de mi parte, mi amigo.
                        sleep 1
                        echo Aunque no queda mucho tiempo para el siguiente reinicio, y después de esto lo olvidarás todo nuevamente, espero que este regalo ayude a que nuestros caminos vuelvan a juntarse.
                        echo "Has obtenido [Final 5: No estás solo]"
                        logro_5=1
                        logro_4=0
                        logro_3=0
                        logro_2=0
                        logro_1=0
                        secret=0
                        sleep 1
                        echo Aquí viene. Adiós amigo.
                        sleep 1
                        fin
                    fi
                else
                    echo Has roto mi corazón...
                    real_answer=0
                    sleep 1
                    logro_4=0
                    logro_3=0
                    logro_2=0
                    logro_1=0
                    secret=0
                    fin
                fi
        else
            echo ¡Vaya forma de gastarme una broma!
            real_answer=0
            sleep 1
            logro_4=0
            logro_3=0
            logro_2=0
            logro_1=0
            secret=0
            fin
        fi
    else
        echo Sabía que esto no era para mí... Soy un iluso
        real_answer=0
        sleep 1
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
        echo 1. 1x Poción de vida.
        echo 2. 1x Poción de ataque.
        echo 3. Volver
        echo 4. 1x Manga de One Piece.
        read -r choose_mochila
        if [[ $choose_mochila -eq 1 ]]; then
            echo La poción de vida no está disponible.
            choose_mochila=0
            bag
        fi
        if [[ $choose_mochila -eq 2 ]]; then
            echo La poción de ataque no está disponible.
            choose_mochila=0
            bag
        fi
        if [[ $choose_mochila -eq 3 ]]; then
            choose_mochila=0
            my_turn
        fi
        if [[ $choose_mochila -eq 4 ]]; then
            echo Lanzas el manga de One Piece hacia Coma Flotante-kun.
            read -r
            choose_mochila=0
            real_ending
        fi
        if [[ $choose_mochila -eq 4 ]]; then
            echo Introduce un valor válido.
            choose_mochila=0
            bag
        fi
    fi
    # No se ha usado objetos
    if [[ ( $mochila_pocion -eq 0 ) && ( $mochila_fuerza -eq 0 ) ]]; then
        echo 1. 1x Poción de vida. 
        echo 2. 1x Poción de Ataque. 
        echo 3. Volver 
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
            choose_mochila=0
            boss_turn
        fi
        if [[ $choose_mochila -eq 2 ]]; then
            echo Te tomas la poción de ataque.
            echo Desafortunadamente te sienta mal y te entra diarrea, por lo que decides terminar el combate lo antes posible para poder ir al baño.
            echo Ahora tu personaje hará x2 más de daño durante todo el combate.
            current_atk=$(( current_atk * 2 ))
            mochila_fuerza=$(( mochila_fuerza + 1 ))
            echo Has consumido 1 poción de ataque.
            choose_mochila=0
            boss_turn
        fi
        if [[ $choose_mochila -eq 3 ]]; then
            choose_mochila=0
            my_turn
        fi
        if [[ $choose_mochila -gt 3 ]];
        then
            echo Introduce un valor válido.
            choose_mochila=0
            bag 
        fi
    fi

    
    # Se ha usado la poción y la fuerza
    if [[ ( $mochila_pocion -eq 1 ) && ( $mochila_fuerza -eq 1 ) ]]; then
        echo No tienes objetos en la mochila.
        choose_mochila=0
        bag
    fi

    # Se ha usado la poción de vida
    if [[ ( $mochila_pocion -eq 1 ) && ( $mochila_fuerza -eq 0 ) ]]; then
        echo 1. 1x Poción de Ataque. 
        echo 2. Volver.
        echo ¿Qué objeto deseas usar?
        read -r choose_mochila
        if [[ $choose_mochila -eq 1 ]]; then
            echo Te tomas la poción de ataque.
            echo Desafortunadamente te sienta mal y te entra diarrea, por lo que decides terminar el combate lo antes posible para poder ir al baño.
            echo Ahora tu personaje hará x2 más de daño durante todo el combate.
            current_atk=$(( current_atk * 2 ))
            mochila_fuerza=$(( mochila_fuerza + 1 ))
            echo Has consumido 1 poción de ataque.
            choose_mochila=0
            boss_turn
        fi

        if [[ $choose_mochila -eq 2 ]]; then
            choose_mochila=0
            my_turn
        fi

        if [[ $choose_mochila -gt 2 ]];
        then
            echo Introduce un valor válido.
            choose_mochila=0
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
            choose_mochila=0
            boss_turn
        fi

        if [[ $choose_mochila -eq 2 ]]; then
            choose_mochila=0
            my_turn
        fi

        if [[ $choose_mochila -gt 2 ]]; then
            echo Introduce un valor válido.
            choose_mochila=0
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
        choose=0
        fight
    fi
    if [[ $choose -eq 2 ]]; then
        choose=0
        character
    fi
    if [[ $choose -eq 3 ]]; then
        choose=0
        bag
    fi
    if [[ $choose -eq 4 ]]; then
        choose=0
        leave
    fi
    if [[ $choose -ge 5 ]]; then
        echo Introduce un valor correcto
        choose=0
        my_turn
    fi
}
###


inicio