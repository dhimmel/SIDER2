
# 4by3
#  ffmpeg -r 6 -i $var/frames/Frame_%03d.png \
#  -vf "scale=iw*1200/ih:1200, crop=1600:1200" -y $var/animation.mp4


# 16by9 1080
for var in substructure-side_effect substructure-indication
do
  ffmpeg -r 6 -i $var/frames/Frame_%03d.png \
  -vf "scale=iw*1080/ih:1080, crop=1920:1080" -y $var/animation.mp4
done


