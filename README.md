# jaguar_id
REUMass Individual Jaguar Identification

This research project was done as part of an REU I participated in at UMass Amherst during Summer 2015. 

My advisor was Subhransu Maji. I worked together with him, Aruni Roy Chowdhury (my graduate student mentor), and Dr. Todd Fuller 
from the UMass department of conservation to create this system. 

Written in Matlab, the goal of this project is to identify individual jaguars in images taken from camera traps in the wild.
Currently, ecologists are trying to track the migration and survival of jaguars across large regions, and they do this by
setting up cameras strapped to trees in the wild that will snap pictures of jaguars as they pass by.
Manually identifying the jaguars in these images requires finding groups of rosettes in their coats that match up with
jaguar images already in the database. This is very time intensive and error prone. 

This research seeks to automate this process by using computer vision, in particular the SIFT (Scale invariant feature
transform) algorithm. It performs fairly accurately on my dataset of less than 300 jaguars, correctly matching features in
pairs of images roughly 90% of the time. This shows that SIFT is a good algorithm for this task. 

Other steps that can be taken to improve the accuracy of this system is to get more training images, perform an 
automated background subtraction operation that will eliminate any potential background matches, and perhaps take images of
the jaguars' backs (by placing the camera higher up on the trees and pointing it down) so that there is no need to try to 
match up different sides of the jaguar. This currently causes some confusion in the system (left sides of jaguars matching up to
right sides of other jaguars).
