/* *************************************************************
 * 6SENG001W Reasoning About Programs
 * Machine:  Asteroids
 * Component: Spaceship & Asteroids arcade game
 * Spec:   Coursework 1
 * Author:   Jayamal Hettiarachchi | w1714876
 * Creation date: 2021-11-19
 ************************************************************ */
 
MACHINE
    Asteroids
    
SEES
    Space
    
CONSTANTS
    asteroids, emptySpace
    
INVARIANT
    asteroids : spaceX_region <-> spaceY_region
    &
    card(asteroids) = 11 //The regions of space are populated by 11 asteroids
    
PROPERTIES
    
    /*Asteroids*/
    asteroids <: space 
    /*Asteroids*/
    
    &
    
    /*The located asteroids as follows*/
    asteroids = {
        3|->2,
        3|->5, 
        5|->4, 
        6|->7, 
        7|->1, 
        7|->5, 
        7|->7, 
        8|->3, 
        10|->6, 
        11|->2, 
        12|->5
    } 
     /*Asteroids Locations*/
    
    &
    
    /*The known empty space*/
    emptySpace <: space 
    &
    emptySpace /\ asteroids = {} 
    &
    emptySpace \/ asteroids = space
    /*The known empty space*/
    
END  /* ASTEROIDS */
