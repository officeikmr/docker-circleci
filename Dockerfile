FROM cimg/ruby:2.7.6-node

LABEL maintainer "Daisuke Fujimura <fd0>"

RUN sudo apt-get update \
    && sudo apt-get -q install fonts-migmix gconf-service graphviz libappindicator3-1 libasound2 libatk1.0-0 libcups2 libdbus-1-3 libgconf-2-4 libgtk-3-0 libnspr4 libxcomposite1 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils libgbm1 \
    && sudo curl -L -o google-chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_106.0.5249.103-1_amd64.deb \
    && sudo dpkg -i google-chrome.deb \
    && sudo sed -i 's|HERE/chrome\"|HERE/chrome\" --disable-setuid-sandbox|g' /opt/google/chrome/google-chrome \
    && sudo rm google-chrome.deb \
    && sudo apt-get -q install -y python3 python3-dev python3-pip python3-venv \
    && sudo pip3 install awsebcli \
    && sudo pip3 install --upgrade awsebcli \
    && sudo rm -rf /var/lib/apt/lists/*
