The dataset is composed of 5 folds to allow 5-fold 'leave one out' cross validation. To prevent overfitting, each fold contains different subjects. 

Each fold is described by a csv file with 12 columns:

user_id - the folder in the dataset containing the image. 
original_image - image name in the dataset.
face_id - the Face ID in the original Flickr image, can be ignored. 
age - age label of the face.
gender - gender label of the face.
x, y, dx, dy - bounding box of the face in the original Flickr image, can be ignored.
tilt_ang, fiducial_yaw_angle - pose of the face in the original Flickr image, can be ignored. 
fiducial_score - score of the landmark detector, can be ignored. 

If you use the dataset, please cite: Eran Eidinger, Roee Enbar, Tal Hassner. Age and Gender Estimation of Unfiltered Faces. Transactions on Information Forensics and Security (IEEE-TIFS), special issue on Facial Biometrics in the Wild, Volume 9, Issue 12, pages 2170 - 2179, 2014.