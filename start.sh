xhost +local:root;

nvidia-docker run -it -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/src keras