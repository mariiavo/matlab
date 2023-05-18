clc
clear

c1_health = 17;
c1_armor = 10;
c1_damage = 20;

c2_health = 15;
c2_armor = 12;
c2_damage = 16;

%This line calls your function and expects two returned variables.
[c1_health,c2_health] = fight(c1_health,c1_armor,c1_damage,c2_health,c2_armor,c2_damage);


%(In-script defined functions are defined at the bottom of section.)
function [c1_health,c2_health] = fight(c1_health,c1_armor,c1_damage,c2_health,c2_armor,c2_damage)
    order=randi([1, 10]);
    if mod(order,2)==0
        health=c1_health;
        armor=c1_armor;
        damage=c2_damage;
    else
        health=c2_health;
        armor=c2_armor;
        damage=c1_damage;
    end
    die=randi([0, 20]);
    if die>armor
        health=health-damage;
    end
    if mod(order,2)==0
        c1_health=health;
    else
        c2_health=health;
    end
    player1=[c1_health,c1_armor,c1_damage]
    player2=[c2_health,c2_armor,c2_damage]
    if (c1_health>0) && (c2_health>0)
        if mod(order,2)==0
            health=c2_health;
            armor=c2_armor;
            damage=c1_damage;
        else
            health=c1_health;
            armor=c1_armor;
            damage=c2_damage;
        end
            die=randi([0, 20]);
        if die>armor
            health=health-damage;
        end
        if mod(order,2)==0
            c2_health=health;
        else
            c1_health=health;
        end
        player1=[c1_health,c1_armor,c1_damage]
        player2=[c2_health,c2_armor,c2_damage]
    end
    if c1_health>c2_health && c1_health>0
        disp('combatant 1 wins!')
    elseif c2_health>c1_health && c2_health>0
        disp('combatant 2 wins!')
    else
        disp('There is no winner today!')
    end


    
    
end