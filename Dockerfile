FROM swift:5.3
LABEL version="1.0.0"
LABEL repository="https://github.com/MatsMoll/action-finch"
LABEL homepage="https://github.com/MatsMoll/action-finch"
LABEL maintainer="Mats E. Mollestad <mats@mollestad.no>"

LABEL "com.github.actions.name"="GitHub Action for Finch"
LABEL "com.github.actions.description"="A tool to enforce generate Changelogs."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="orange"

# Install SwiftLint
RUN git clone https://github.com/namolnad/Finch.git && \
    cd Finch && \
    make install && \
    cd .. && \
    rm -rf Finch && \
    apt-get -qq update && \ 
    apt-get install -y jq curl

# Print Installed SwiftLint Version
RUN finch --version

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
