============================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     To execute, merely load, reset and run.
;;;======================================================

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no 1 2))
   (if (or (eq ?response yes) (eq ?response 1))
       then yes 
       else no))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-venue ""
   (not (venue ?))
   (not (sport ?))
   =>
   (assert (venue (yes-or-no-p "Practicing water sports (yes/no)? "))))
   
(defrule determine-water-team ""
   (venue yes)
   (not (sport ?))
   =>
   (assert (water-team (yes-or-no-p "A team sport yes/no)? "))))

(defrule determine-device-management ""
   (water-team yes)
   (not (sport ?))   
   =>
   (assert (device-management (yes-or-no-p "The basis of the sport is a device management (yes/no)? "))))

(defrule determine-team-water-games ""
   (device-management no)
   (not (sport ?))   
   =>
   (assert (team-water-games (yes-or-no-p "Playing sport (yes/no)? "))))

(defrule determine-hard-house-sport ""
   (water-team no)
   (not (sport ?))   
   =>
   (assert (hard-house-sport (yes-or-no-p "Sport guided wave on the coordination of movements (yes/no)? "))))

(defrule determine-earth-team ""

   (venue no)
   (not (sport ?))
   =>
   (assert (earth-team (yes-or-no-p "A team sport (yes/no)? "))))

(defrule determine-earth-team-indoors ""
   (earth-team yes)
   (not (sport ?))   
   =>
   (assert (earth-team-indoors (yes-or-no-p "Classes are held indoors (yes/no)? "))))

(defrule determine-earth-speed ""
   (earth-team-indoors yes)
   (not (sport ?))   
   =>
   (assert (earth-speed (yes-or-no-p "High-speed sport (yes/no)? "))))

(defrule determine-earth-game-hands ""
   (earth-speed yes)
   (not (sport ?))   
   =>
   (assert (game-hands (yes-or-no-p "Game hands (yes/no)? "))))

(defrule determine-earth-team-seasonal ""
   (earth-team-indoors no)
   (not (sport ?))   
   =>
   (assert (earth-team-seasonal (ask-question "Seasonal sport (winter/ summer/ anytime)? " winter summer anytime))))

(defrule determine-earth-physical-contact ""
   (earth-team-seasonal anytime)
   (not (sport ?))   
   =>
   (assert (earth-physical-contact (yes-or-no-p "Is it permissible physical contact (yes/no)? "))))

(defrule determine-earth-single-seasonal ""
   (earth-team no)
   (not (sport ?))   
   =>
   (assert (earth-single-seasonal (yes-or-no-p "Seasonal sport  (yes/no)? "))))

(defrule determine-earth-martial-arts ""
   (earth-single-seasonal no)
   (not (sport ?))   
   =>
   (assert (earth-martial-arts (yes-or-no-p "Martial arts (yes/no)? "))))

(defrule determine-earth-power-quality ""
   (earth-martial-arts no)0
   (not (sport ?))   
   =>
   (assert (earth-power-quality (yes-or-no-p "The development of power qualities (yes/no)? "))))

(defrule determine-earth-fight ""
   (earth-martial-arts yes)
   (not (sport ?))   
   =>
   (assert (earth-fight (yes-or-no-p "Fight (yes/no)? "))))

(defrule determine-earth-combat-grips ""
   (earth-fight yes)
   (not (sport ?))   
   =>
   (assert (earth-combat-grips (yes-or-no-p "The combat grips? (yes/no)? "))))

;;;****************
;;;* REPAIR RULES *
;;;****************

(defrule ans-device-management ""
   (device-management yes)
   (not (sport ?))
   =>
  (assert (sport "Rowing")))

(defrule ans-team-water-games-yes ""
   (team-water-games yes)
   (not (sport ?))
   =>
   (assert (sport "Water Polo"))) 

(defrule ans-team-water-games-no ""
   (team-water-games no)
   (not (sport ?))
   =>
   (assert (sport "Synchronized swimming"))) 

(defrule ans-hard-house-sport-no ""
   (hard-house-sport yes)
   (not (sport ?))
   =>
   (assert (sport "Diving")))     

(defrule ans-hard-house-sport-yes ""
   (hard-house-sport yes)
   (not (sport ?))
   =>
   (assert (sport "Swimming"))) 

(defrule ans-game-hards-yes ""
   (engine-knocks yes)
   (not (sport ?))
   =>
   (assert (sport "Basketball")))

(defrule ans-game-hards ""
   (engine-knocks no)
   (not (sport ?))
   =>
   (assert (sport "Futsal")))

(defrule ans-earth-speed-no ""
   (earth-speed no)
   (not (sport ?))
   =>
   (assert (sport "Volleyball")))

(defrule ans-earth-team-seasonal ""
   (earth-team-seasonal winter)
   (not (sport ?))
   =>
   (assert (sport "Hockey")))

(defrule ans-earth-team-seasonal ""
   (earth-team-seasonal summer)
   (not (sport ?))
   =>
   (assert (sport "Polo")))

(defrule ans-earth-physical-contact-yes ""
   (earth-physical-contact yes)
   (not (sport ?))
   =>
   (assert (sport "American football")))

(defrule ans-earth-physical-contact-no ""
   (earth-physical-contact no)
   (not (sport ?))
   =>
   (assert (sport "Football")))

(defrule ans-earth-single-seasonal ""
   (earth-single-seasonal yes)
   (not (sport ?))
   =>
   (assert (sport "Ski race")))

(defrule ans-earth-fight ""
   (earth-fight no)
   (not (sport ?))
   =>
   (assert (sport "Boxing")))

(defrule ans-earth-combat-grips-no ""
   (earth-combat-grips no)
   (not (sport ?))
   =>
   (assert (sport "Karate")))

(defrule ans-earth-combat-grips-yes ""
   (earth-combat-grips yes)
   (not (sport ?))
   =>
   (assert (sport "Greco-Roman wrestling")))

(defrule ans-earth-power-quality-yes ""
  (earth-power-quality yes)
  (not (sport ?))
  =>
  (assert (sport "Bodybuilding")))

(defrule ans-earth-power-quality-no ""
  (earth-power-quality no)
  (not (sport ?))
  =>
  (assert (sport "Cross-country")))

;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "The Sports System")
  (printout t crlf crlf))

(defrule print-sport ""
  (declare (salience 10))
  (sport ?item)
  =>
  (printout t crlf crlf)
  (printout t "Suggested Repair:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))
