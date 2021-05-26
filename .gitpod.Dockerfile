FROM gitpod/workspace-full-vnc

# RUN touch /etc/sudoers
# RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod \
#     # passwordless sudo for users in the 'sudo' group
#     && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
# COPY ide /ide
# RUN chmod a+x /ide/startup.sh
RUN sudo add-apt-repository ppa:kelleyk/emacs
RUN sudo apt-get update
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install keyboard-configuration
# ENV
ENV DEBIAN_FRONTEND noninteractive
RUN sudo apt-get install emacs27 -y
USER gitpod

COPY gdscript.el ~/.emacs.d/init.el
COPY Godot_v3.3.2-stable_x11.64 ~/
COPY godot ~/
