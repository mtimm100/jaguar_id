# jaguar_id
REUMass Individual Jaguar Identification

This research project was done as part of an REU I participated in at UMass Amherst during Summer 2015. 

My advisor was Subhransu Maji. I worked together with him, Aruni Roy Chowdhury (my graduate student mentor), and Dr. Todd Fuller 
from the UMass department of conservation to create this system. 

Written in Matlab, the goal of this project is to identify individual jaguars in images taken from camera traps in the wild.
Currently, ecologists are trying to track the migration and survival of jaguars across large regions, and they do this by
setting up cameras strapped to trees in the wild that will snap pictures of jaguars as they pass by automatically.
Some ecology research groups in Central/South America have large databases of jaguar images that need to be matched up with previous jaguars they have been tracking. They currently do this through manual identification.
Manually identifying the jaguars in these images requires finding groups of rosettes in their coats that match up with
jaguar images already in the database. This is very time intensive and error prone. 

This research seeks to automate this process by using computer vision, in particular the SIFT (Scale invariant feature
transform) algorithm. SIFT will detect features in the image and match feature descriptors across multiple images. Sets of these matches indicate similar patterns on the jaguars. If the set has a high number of features matched up between two images, we predict that those two images are of the same jaguar.

The system performs fairly accurately on my dataset of around 300 jaguar images, correctly matching features in
pairs of images roughly 90% of the time. This shows that SIFT may be a good algorithm for this task. Further testing of the efficacy of SIFT for this problem should be done by obtaining more images of jaguars.

Other steps that can be taken to improve the accuracy of this system are to perform an 
automated background subtraction operation that will eliminate any potential background matches and have the ecologists take images of the jaguars' backs (by placing the camera higher up on the trees and pointing it down) so that there is no need to try to match up different sides of the jaguar. This currently causes some confusion in the system (left sides of jaguars matching up to right sides of other jaguars). 

Higher resolution vs. lower resolution images did not really affect the accuracy - however, jaguars running too fast past the camera traps caused motion blur in some images, which negatively affected the accuracy. 

We had some images for jaguars in various stages of life - one jaguar has images of it as a baby all the way through adulthood. The system correctly identified the jaguar regardless of its age/size in the pictures.
