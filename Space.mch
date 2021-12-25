 /* *************************************************************
 * 6SENG001W Reasoning About Programs
 * Machine:  Space
 * Component: Spaceship & Asteroids arcade game
 * Spec:   Coursework 1
 * Author:   Jayamal Hettiarachchi | w1714876
 * Creation date: 2021-11-19
 ************************************************************ */
 
MACHINE
    Space
    
CONSTANTS
     spaceX_region,
     spaceX_limit, 
     spaceY_region, 
     spaceY_limit,
     space
     
 PROPERTIES
     
     /* space X axis limited up to 12 */
     spaceX_limit : NATURAL1  &  spaceX_limit = 12
     /* spaceX_limit */
     
     &
     
     /* space Y axis limited up to 7 */
     spaceY_limit : NATURAL1  &  spaceY_limit = 7
     /* spaceY_limit */
     
     &
     
     /* space X region will start from 1 and ends at 12 */
     spaceX_region <: NATURAL1  &  spaceX_region = 1..12
     /* spaceX_region */
     
     &
     
     /* space Y region will start from 1 and ends at 7 */
     spaceY_region <: NATURAL1  &  spaceY_region = 1..7
     /* spaceY_region */
     
     &
     
     /*The Space is a spaceX_region *  spaceY_region grid */
     space  =  spaceX_region *  spaceY_region
     /* space */     
       
END /* SPACE */
